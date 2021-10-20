class AddDeliveryManager < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_managers do |t|
      t.string :enabled

      t.timestamps
    end
  end
end
