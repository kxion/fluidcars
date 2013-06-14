class SearchInfosController < ApplicationController

  def result
    @infos = Info.joins(:car).where("location like ? and rent_end > ? and status = 'active' ", "%" + params[:location] +"%", Time.now.to_date)
    @results = @infos.paginate(page: params[:page], per_page: 5)
  end

end
