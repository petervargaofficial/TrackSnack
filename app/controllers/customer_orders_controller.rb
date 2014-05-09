class CustomerOrdersController < ApplicationController  
  before_filter :signed_in_user
  
	# before_all => if the customer is not logged in - make them login

  def index
  	# This is the view that customer sees after login. 
  		# It shows pretty much the same as root_path Ideally showing personalized address/past orders (in v2)
  	# [optional] TODO: send to view only relevant vendors based on the address/distance
  	# It should display the map zoomed in on current autolocalized area
			# showing pin[with listing# (of table bellow)]for each foodtruck and name of foodtruck on mouseover
			# showing (blue)circle for current_position (use autolocalization)
			# map should have possibility to zoom-in/out , move around
		# list of available (relevant) foodtrucks bellow map listing:
			# Foodtruck Name, logo, (cousine), (distance from current location)
			# show button next to each lising that will take them to order detail {post "customer_orders/create_order"}
				# sending vendor_id as parameter
			# [TODO feature] the list is sorted by distance from current location (based on autolocalization). 
				# this will be computed at the time of rendering
  	@vendors = Vendor.all
    gon.vendors = @vendors
  end

  def create_order
  	# Create new order with vendor_id from parameter , setting order.customer_confirmed = false 
  		# (leaving order.vendor_confirmed nil)
  	# redirecting to new_customer_order_path with order_id AND vendor_id as parameter
  	
  	# TODO make this current logged user
  	userID = current_user.id
  	new_order = Order.create(user_id:userID)
  	new_order.customer_confirmed = false
  	new_order.save
  	redirect_to new_customer_order_path(order_id:new_order.id, vendor_id:params[:vendor_id])
  end

  def new
  	# Shows:
  	# Logo, Name of the vendor (+ TODO ideally cousine, distance from current autolocalized location)
  	# Menu(<form>) of chosen vendor (params[:vendor_id]) showing item_name, item_description, item_price in a table
  		# a blank field next to each order allowing customer to specify quantity of item within order
  	# Big button saying "Preview order" taking customer to post @ "customer_orders/add_items_to_order" path
  		# sending order_id , all vendor items IDs (menu_item.id) and quantities from the form as params
  	# @menu_items for displaying all the menu items of particular vendor
  	@order = Order.find_by_id(params[:order_id])
  	@vendor = Vendor.find_by_id(params[:vendor_id])
  	@menu_items = @vendor.menu_items
  	# TODO: use currenly signed customer instead
  	@user_id = current_user.id
  end

  def add_items_to_order
  	# Creating items from params (that are not 0) in order_item_quantities with corresponding quantity
  		# using order_id , item_id from params
	# redirect customer to customer_orders/customer_confirm_order_view passing order_id
  	params[:menu_items].each do |key, value|
  		if value != 0
  			order_item_quantity = OrderItemQuantity.where(order_id: params[:order_id]).find_by_menu_item_id(key)
  			if order_item_quantity == nil
  				OrderItemQuantity.create(order_id: params[:order_id], menu_item_id: key, quantity: value)
  			else
  				order_item_quantity.update(order_id: params[:order_id], menu_item_id: key, quantity: value)
  			end
  		end
  	end
  	redirect_to "/customer_orders/customer_confirm_order_view?order_id=#{params[:order_id]}"
  end

  def customer_confirm_order_view
  	# displaying all the items for particular order_id (from params). 
  		# There is has_many :menu_items, through: :order_item_quantities relationship so using order.menu_items
  		# item_name, quantity, price, $sub-total (computed when rendered as quantity x price) [adding it to $total]
	# displaying $total for all items (was computed as we rendered each line)
	# showing "Order Now" button redirecting customer_order_path(order_id) showing particular order to customer
	  @order = Order.find_by_id(params[:order_id])
    @order_item_quantities = @order.order_item_quantities	
  end

  def customer_confirmed
  	# chaning value order.customer_confirmed = true
  	# redirecting to show page
  	order = Order.find_by_id(params[:order_id])
  	order.update(customer_confirmed: true)
  	redirect_to customer_order_path(order)
  end


  def show
  	# Shows particular order detail:
  		# If order(from params).vendor_confirmed:
  			# false = "Your order was send to vendor for confirmation, give them a sec to confirm please" (in red/orange)
  				# refresh page every minute
  			# true = "Yeeeey, your order was confirmed, pick up your food @ foodtruck. Buon Appetito!" (green)
  		# (TODO bonus) mini-map with location of foodtruck
  		# showing order details with sub-total/totals
  	@order = Order.find_by_id(params[:id])
  	@order_item_quantities = @order.order_item_quantities
  	if @order.vendor_confirmed
  		@confirmation_text = "Yeeeey, your order was confirmed, pick up your food @ foodtruck. Buon Appetito!"
  	else
  		@confirmation_text = "Your order was send to vendor for confirmation, give them a sec to confirm please"
  	end
  end
end
