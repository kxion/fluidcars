class HomePagesController < ApplicationController

  def home
    # Set headers
    # headers["loveltyoic"] = "Top secret"
    # @infos = Info.includes(:car).limit(9)
    # if session[:current_city].nil?
    #   loc = locate_by_ip(request.env['HTTP_X_FORWARDED_FOR']||request.remote_ip)
    #   if loc['status'] == 0
    #     session[:current_city] = loc['content']['address_detail']['city']
    #     session[:current_gps] = [ loc['content']['point']['x'], loc['content']['point']['y'] ]
    #   end
    # end
    @recommands = Rent.all.limit(10)
    @realip = request.headers['X-Real-IP']
    fresh_when @recommands, :etag => @recommands, :last_modified => DateTime.now.beginning_of_week
    Rails.logger.info @realip
  end
end
