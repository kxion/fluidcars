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
    redirect_to profile_path(current_user)
  end

  def address
    @profile = current_user.profile
    @profile.locations.create(location_params)
    flash[:success] = "地址添加成功！"
    redirect_to main_users_url 
  end

  def profile_params
    params.require(:profile).permit(:avatar, :avatar_cache, :name, :contact)
  end

  def location_params
    params.require(:location).permit(:province, :district, :detail, :city)
  end

end
