class SearchInfosController < ApplicationController
  def result
  	@infos = Info.where("location like ? ","%#{params[:location]}%")
  end
end
