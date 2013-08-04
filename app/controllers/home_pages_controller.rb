class HomePagesController < ApplicationController
  def home
    # Set headers
    # headers["loveltyoic"] = "Top secret"
    @infos = Info.includes(:car).limit(9)
  end
end
