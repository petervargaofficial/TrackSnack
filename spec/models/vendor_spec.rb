require 'spec_helper'

describe Vendor do
 it 'should respond to link and random_string' do
    vendor = Vendor.create(name: "Jackie's burger", latitude: 30.779691, longitude: -125.394849)
    vendor.should respond_to(:name)
    vendor.should respond_to(:latitude)
    vendor.should respond_to(:longitude)
  end
end
