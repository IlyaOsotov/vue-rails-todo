class ChangeDeliveryTypeTypeToOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :delivery_type, :boolean
    add_column :orders, :status, :integer, default: 0
  end
end
