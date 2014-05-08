class VendorsController < ApplicationController
	def index
		@vendors = Vendor.all
	end

	def new
		@vendor = Vendor.new
	end

	def create
		vendor = Vendor.create vendor_params
		redirect_to(vendor)
	end

	def show
		@vendor = Vendor.find_by_id(params[:id])
	end

	def edit
		@vendor = Vendor.find_by_id(params[:id])
	end

	def update
		vendor = Vendor.find_by_id(params[:id])
		vendor.update(vendor_params)
		redirect_to vendors_path
	end

	def destroy
		Vendor.find_by_id(params[:id]).delete
		redirect_to vendors_path
	end

	private

	def vendor_params
		params.require(:vendor).permit(:name, :logo, :latitude, :longitude)
	end

end
