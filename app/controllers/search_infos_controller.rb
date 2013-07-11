class SearchInfosController < ApplicationController
  def result
    @infos = Info.includes(:car).joins(:car).where("location like ? and rent_end > ? and status = 'active' ", "%" + params[:location] + "%", Time.now.to_date)
    @results = @infos.paginate(page: params[:page], per_page: 5)
    render 'result'
  end

  def search_date
    @infos = Info.includes(:car).where("rent_start <= ? and rent_end >= ?", params[:rent_start], params[:rent_end])
    @results = @infos.paginate(page: params[:page], per_page: 5)
    render 'result'
  end

end
