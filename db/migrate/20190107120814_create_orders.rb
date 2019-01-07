class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :price
      t.datetime :delivery_date
      t.boolean :delivery_type

      t.timestamps null: false
    end

    add_reference :order_items, :orders, index: true
  end
end
