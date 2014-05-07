class CreateOrderItemQuantities < ActiveRecord::Migration
  def change
    create_table :order_item_quantities do |t|
      t.integer :quantity
      t.references :order, index: true
      t.references :menu_item, index: true

      t.timestamps
    end
  end
end
