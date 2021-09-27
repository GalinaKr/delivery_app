class AddEstimatedDeliveryDate < ActiveRecord::Migration[6.1]
  def change
    add_column :packages, :estimated_delivery_date, :date

    remove_column :packages, :delivery_status

    add_column :packages, :delivery_status, :integer, :default => 0
  end
end
