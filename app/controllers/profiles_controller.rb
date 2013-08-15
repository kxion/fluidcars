class ProfilesController < ApplicationController
  def show
    if signed_in?
      @profile = current_user.profile
      render 'show'
    else
      redirect_to login_url
    end
  end

  def update
    profile = current_user.profile
    profile.avatar = params[:profile][:avatar]
    profile.save
    # @profile.update_attributes!(params[:profile])
    flash[:notice] = "个人资料更新成功！"
    redirect_to profile_url
  end
end
