class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  private

  def have_car
    unless current_user.cars.any?
      store_location
      redirect_to new_car_url
    end
  end

end
