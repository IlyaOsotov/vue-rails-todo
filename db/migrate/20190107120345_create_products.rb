class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
    
    add_reference :order_items, :products, index: true
  end
end
