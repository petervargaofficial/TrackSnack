class MenuItemsController < ApplicationController
  def index
  	@menu_items = MenuItem.all
  end

  def new
  	@menu_item = MenuItem.new
  end

  def create
  	menu_item = MenuItem.create(menu_item_params)
  	redirect_to(menu_item)
  end

  def edit
  	@menu_item = MenuItem.find_by_id(params[:id])
  end

  def update
  	menu_item = MenuItem.find_by_id(params[:id])
  	menu_item.update menu_item_params
  	redirect_to(menu_items_path)
  end

  def show
  	@menu_item = MenuItem.find_by_id(params[:id])
  end

  def destroy
  	MenuItem.find_by_id(params[:id]).delete
  	redirect_to(menu_items_path)
  end

  private
  def menu_item_params
  	params.require(:menu_item).permit(:item_name, :item_description, :item_price, :vendor_id)
  end

end
