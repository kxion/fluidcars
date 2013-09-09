class HomePagesController < ApplicationController
  include BaiduMap
  def home
    # Set headers
    # headers["loveltyoic"] = "Top secret"
    # @infos = Info.includes(:car).limit(9)
    # if session[:current_city].nil?
    #   loc = locate_by_ip(request.remote_ip)
    #   if loc['status'] == 0
    #     session[:current_city] = loc['content']['address_detail']['city']
    #     session[:current_gps] = [ loc['content']['point']['x'], loc['content']['point']['y'] ]
    #   end
    # end
  end
end
