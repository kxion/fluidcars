class RentsController < ApplicationController
  before_filter :signed_in_user, except: [:show]

  # 显示详细出租信息
  def show
    @rent = Rent.find(params[:id])
    @comments = Comment.where('car_id' => @rent.car.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rent }
    end
  end

  # 删除出租信息
  def destroy
    rent = current_user.rents.find(params[:id])
    rent.destroy
    respond_to do |format|
      format.html { redirect_to myrents_url }
      format.json { head :no_content }
    end
  end
  # 显示当前用户的所有出租信息
  def myrents
    @rents = current_user.rents.desc(:create_at).paginate(page: params[:page], per_page: 5)
  end

  # 选择要出租的车辆
  def select_car
    @cars = current_user.cars.paginate(page: params[:page], per_page: 5)
    render 'select_car'
  end
  # 确认出租车辆
  def confirm_select_car
    selected_car = Car.find(params[:car_id])
    if selected_car.user_id == current_user.id
      rent = Rent.create!(car: selected_car)
      session[:current_rent_id] = rent.id
      redirect_to select_time_url
    else
      flash[:notice] = '只能出租属于自己的车辆'
      redirect_to select_car_url
    end
  end
  # 选择出租时间
  def select_time
    @rent = Rent.new
  end
  # 确认时间
  def confirm_select_time
    @rent = Rent.find(session[:current_rent_id])
    @rent.onwer_name = current_user.name
    @rent.onwer_avatar = current_user.profile.avatar
    @rent.update_attributes!(params[:rent])
    @rent.user_id = current_user.id
    if @rent.save
      redirect_to set_rate_url
    else
      render 'select_time'
    end
  end
  # 选择费率
  def set_rate
    
  end
  # 确认费率
  def confirm_set_rate
    @rent = Rent.find(session[:current_rent_id])
    @rent.update_attributes(rate: params[:rate])
    redirect_to complete_url
  end
  # 出租完成
  def complete
    @rent = Rent.find(session[:current_rent_id])   
    session[:current_rent_id] = nil
    session[:current_car_id] = nil 
  end
end
