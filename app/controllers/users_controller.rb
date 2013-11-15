class UsersController < ApplicationController
  before_action :signed_in_user, except: [:show]
  
  def main
    @user = current_user
  end  
  
  def panel
    @profile = current_user.profile
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @rents = @user.rents.page params[:page]
  end

end
