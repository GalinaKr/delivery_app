class ChangeToUuidIntoPackage < ActiveRecord::Migration[6.1]
  def up
    add_column :packages, :uuid, :uuid, default: "gen_random_uuid()", null: false
    rename_column :packages, :id, :integer_id
    rename_column :packages, :uuid, :id
    execute "ALTER TABLE packages drop constraint packages_pkey;"
    execute "ALTER TABLE packages ADD PRIMARY KEY (id);"

    # Optionally you remove auto-incremented
    # default value for integer_id column
    execute "ALTER TABLE ONLY packages ALTER COLUMN integer_id DROP DEFAULT;"
    change_column_null :packages, :integer_id, true
    execute "DROP SEQUENCE IF EXISTS packages_id_seq"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
