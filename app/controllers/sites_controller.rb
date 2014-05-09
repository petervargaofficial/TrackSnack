class SitesController < ApplicationController
  before_filter :signed_in_user

  def index
    # This is the main page for all the visitors of tracksnack.(herokuapp.)com
    # It should display the map zoomed in on current autolocalized area
    # showing pin[with listing# (of table bellow)]for each foodtruck and name of foodtruck on mouseover
    # showing (blue)circle for current_position (use autolocalization)
    # map should have possibility to zoom-in/out , move around
    # list of available foodtrucks bellow map listing:
    # Foodtruck Name, logo, (cousine), (distance from current location)
    # show button next to each lising that will take them to login page
    # [TODO feature] the list is sorted by distance from current location (based on autolocalization).
    # this will be computed at the time of rendering

    # TODO change this to actual validation
    redirect_to customer_orders_path
  end

  def admin
    # TODO if not logged in as admin role send to login page notifying that they need to login as admin
  end

  def vendor_login

  end

  def how_to_use
  end

  def contacts
  end
end
