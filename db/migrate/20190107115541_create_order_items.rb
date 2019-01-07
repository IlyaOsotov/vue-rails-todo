class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :name
      t.integer :price
      t.timestamps null: false
    end
  end
end
