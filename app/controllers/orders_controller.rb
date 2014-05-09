class OrdersController < ApplicationController
  before_filter :signed_in_user

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.create(order_params)
    redirect_to(order)
  end

  def show
    @order = Order.find_by_id(params[:id])
  end

  def edit
    @order = Order.find_by_id(params[:id])
  end

  def update
    Order.find_by_id(params[:id]).update(order_params)
    redirect_to orders_path
  end

  def destroy
    Order.find_by_id(params[:id]).delete
    redirect_to orders_path
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :customer_confirmed, :vendor_confirmed)
  end

end
