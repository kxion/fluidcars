class SearchRentsController < ApplicationController
  def search_rents_by_location
    @rents = Rent.where('car.location.detail' => /#{params[:location]}/).where(:end.gt => Time.now.to_date)
    @results = @rents.page params[:page]
    render 'result'
  end

  def search_rents_by_date
    @rents = Rent.where(:start.lte => params[:rent][:start]).where(:end.gte => params[:rent][:end])
    @results = @rents.page params[:page]
    render 'result'
  end

  def search_rents_by_city
    @rents = Rent.where('car.location.city' => params[:city]).desc(:created_at).page params[:page]
    session[:current_city] = params[:city]
    render 'rents/index'
  end

  def search_rents_by_car
    @rents = Rent.find_by(car_id: params[:car_id])
    render 'rents/index'
  end
end
