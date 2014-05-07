class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :item_name
      t.text :item_description
      t.float :item_price
      t.references :vendor, index: true

      t.timestamps
    end
  end
end
