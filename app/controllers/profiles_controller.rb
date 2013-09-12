class ProfilesController < ApplicationController
  
  def show
    @profile = User.find(params[:id]).profile
  end

  def edit
    if signed_in?
      @profile = current_user.profile
    else 
      redirect_to login_url
    end
  end

  def update
    @profile = current_user.profile
    # debugger
    @profile.update_attributes!(profile_params)
    flash[:success] = "个人资料更新成功！"
    redirect_to profile_path(current_user)
  end

  def profile_params
    params.require(:profile).permit(:avatar, :avatar_cache, :nickname)
  end

end
