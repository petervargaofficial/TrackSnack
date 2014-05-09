class AddVendorConfirmedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :vendor_confirmed, :boolean
  end
end
