class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_item_quantities
  has_many :menu_items, through: :order_item_quantities
end
