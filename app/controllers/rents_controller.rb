class RentsController < ApplicationController
  before_action :signed_in_user, except: [:show, :search_reservation]
  layout 'rent', only: [:select_car, :select_time, :set_rate, :complete]
  # 显示详细出租信息
  def show
    @rent = Rent.includes(:user).find(params[:id])
    @car = @rent.car
    @comments = Comment.where('car_id' => @rent.car.id)
    @more = @rent.user.rents.limit(5)
  end

  # 删除出租信息
  def destroy
    rent = current_user.rents.find(params[:id])
    if rent.destroy
      redirect_to myrents_url 
    end

  end
  # 显示当前用户的所有出租信息
  def myrents
    @rents = current_user.rents.desc(:create_at).page params[:page]
  end

  # 选择要出租的车辆
  def select_car
    @cars = current_user.cars.page params[:page]
    if @cars.empty?
      flash[:warning] = '请先创建车辆信息'
      redirect_to new_car_url
    else
      render 'select_car'
    end
  end
  # 确认出租车辆
  def confirm_select_car
    selected_car = Car.find(params[:car_id])

    if selected_car.user_id == current_user.id
      rent = Rent.create(car: selected_car, user_id: current_user.id, complete: false)
      session[:current_rent_id] = rent.id
      redirect_to select_time_rents_url
    else
      flash[:error] = '只能出租属于自己的车辆'
      redirect_to select_car_rents_url
    end
  end
  # 选择出租时间
  def select_time
    @rent = Rent.new
  end
  # 确认时间
  def confirm_select_time
    @rent = Rent.unscoped.find(session[:current_rent_id])
    @rent.update_attributes(rent_params)
    @rent.reservations.create(start: @rent.start, end: @rent.end)
    if @rent.save
      redirect_to set_rate_rents_url
    else
      render 'select_time'
    end
  end
  # 选择费率
  def set_rate
    
  end
  # 确认费率
  def confirm_set_rate
    @rent = Rent.unscoped.find(session[:current_rent_id])
    @rent.rate = params[:rate]
    @rent.save
    redirect_to complete_rents_url
  end
  # 出租完成
  def complete
    @rent = Rent.unscoped.find(session[:current_rent_id])
    @rent.update_attributes(complete: true)
    @car = @rent.car
    flash.now[:success] = "发布成功！"   
    session[:current_rent_id] = nil
    session[:current_car_id] = nil 
  end

  def search_reservation
    @rent = Rent.find(params[:rent_id])
    reservations = @rent.reservations.in_callendar(params[:start].to_i,params[:end].to_i)
    events = []
    reservations.each do |res|
      events << res.json_events
    end
    render json: events.to_json
  end

  def rent_params
    params.require(:rent).permit(:start, :end, :period_type)
  end

end
