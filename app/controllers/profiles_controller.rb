class ProfilesController < ApplicationController
  
  def show
    @profile = User.profile.find(params[:id])
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
    @profile.avatar = params[:profile][:avatar]
    @profile.save
    # @profile.update_attributes!(params[:profile])
    flash[:notice] = "个人资料更新成功！"
    render 'show'
  end
end
