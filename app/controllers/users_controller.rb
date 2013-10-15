class UsersController < ApplicationController
  before_action :signed_in_user
  
  def main
    @user = current_user
  end  
  
  def panel
    @profile = current_user.profile
  end
end
