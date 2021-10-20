class AddUuidToDeliveryManager < ActiveRecord::Migration[6.1]
  def up
    add_column :delivery_managers, :uuid, :uuid, default: "gen_random_uuid()", null: false
    rename_column :delivery_managers, :id, :integer_id
    rename_column :delivery_managers, :uuid, :id
    execute "ALTER TABLE delivery_managers drop constraint delivery_managers_pkey;"
    execute "ALTER TABLE delivery_managers ADD PRIMARY KEY (id);"

    # Optionally you remove auto-incremented
    # default value for integer_id column
    execute "ALTER TABLE ONLY delivery_managers ALTER COLUMN integer_id DROP DEFAULT;"
    change_column_null :delivery_managers, :integer_id, true
    execute "DROP SEQUENCE IF EXISTS delivery_managers_id_seq"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
