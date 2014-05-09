class MenuItem < ActiveRecord::Base
  belongs_to :vendor
  has_many :order_item_quantities
  has_many :orders, through: :order_item_quantities
end
