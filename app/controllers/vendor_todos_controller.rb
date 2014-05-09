class VendorTodosController < ApplicationController
  before_filter :signed_in_user

  def index
    @orders = Order.where(user_id:current_user.id)
  end

  def edit
    @order = Order.find_by_id(params[:order_id])
    @order_item_quantities = @order.order_item_quantities
  end

  def update
    Order.find_by_id(params[:order_id]).update(vendor_confirmed:true)
    redirect_to '/vendor_todos/index'
  end

  def show
  end
end
