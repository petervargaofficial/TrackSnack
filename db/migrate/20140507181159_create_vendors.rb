class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :logo
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
