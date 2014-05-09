class FixOrderConfirmName < ActiveRecord::Migration
  def change
  	rename_column :orders, :confirmed, :customer_confirmed
  end
end
