class SearchInfosController < ApplicationController
  def result
  	@infos = Info.find_all_by_location(params[:location])
  end
end
