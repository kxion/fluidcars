class SearchInfosController < ApplicationController
  def result
    @infos = Info.includes(:car, :rate).where("cars.location like ? and rent_end > ? and status = 'active' ", "%" + params[:location] + "%", Time.now.to_date)
    @results = @infos.paginate(page: params[:page], per_page: 5)
    render 'result'
  end

  def search_date
    @infos = @infos.where("rent_start <= ? and rent_end >= ?", params[:rent_start], params[:rent_end])
    @results = @infos.paginate(page: params[:page], per_page: 5)
    render 'result'
  end

  def search_info_by_city
    @infos = Info.includes(:car, :rate).where( "rent_end > ? and status = 'active' and cars.city = ?", Time.now.to_date, params[:city]).order("infos.created_at DESC").paginate(page: params[:page], per_page: 5)
    session[:current_city] = params[:city]
    render 'infos/index'
  end
end
