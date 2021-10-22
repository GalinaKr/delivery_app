class CreatePackageAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :package_assignments do |t|
      t.references :courier, null: false, foreign_key: true, type: :uuid
      t.references :package, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
