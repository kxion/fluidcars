class UsersController < ApplicationController
  before_action :signed_in_user
  
  def panel
    @profile = current_user.profile
  end
end
