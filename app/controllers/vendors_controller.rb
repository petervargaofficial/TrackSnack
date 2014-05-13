class VendorsController < ApplicationController
  before_filter :signed_in_user

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
    @vendor = Vendor.find_by_id(id)
  end

  def edit
    @vendor = Vendor.find_by_id(id)
  end

  def update
    vendor = Vendor.find_by_id(id)
    vendor.update(vendor_params)
    redirect_to vendors_path
  end

  def destroy
    Vendor.find_by_id(id).delete
    redirect_to vendors_path
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :logo, :latitude, :longitude)
  end

  def id
    params[:id]
  end

end
