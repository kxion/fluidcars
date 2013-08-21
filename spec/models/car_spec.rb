require 'spec_helper'

describe Car do
  before(:each) do
    @car = Car.new
    @car.build_location
  end

  it 'should return gps' do
    @car.location.detail = '国购广场'
    @car.location.city = '合肥'
    @car.gps_from_baidu_map
    @car.location.gps[0].should == 117.26234923798
  end
end