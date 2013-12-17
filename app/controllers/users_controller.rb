class UsersController < ApplicationController
  before_action :signed_in_user, except: [:show]
  
  def main
    @user = current_user
    @profile = @user.profile
    @locations = @user.profile.locations
  end  
  
  def panel
    @profile = current_user.profile
  end

  def show
    @user = User.find(name: params[:name]) || User.find(params[:id])
    @profile = @user.profile
    @rents = @user.rents.page params[:page]
  end

end
