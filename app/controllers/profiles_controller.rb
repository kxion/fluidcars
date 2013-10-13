class ProfilesController < ApplicationController
  before_action :signed_in_user, except: :show
  
  def show
    @profile = User.find(params[:id]).profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    # debugger
    @profile.update_attributes!(profile_params)
    flash[:success] = "个人资料更新成功！"
    redirect_to panel_users_url
  end

  def profile_params
    params.require(:profile).permit(:avatar, :avatar_cache, :nickname, :contact)
  end

end
