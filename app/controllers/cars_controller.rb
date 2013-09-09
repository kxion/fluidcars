class CarsController < ApplicationController
  before_filter :signed_in_user
  # 搜索指定用户的所有车辆
  def search_cars_by_onwer
    @cars = Car.find_by(user_id: params[:onwer_id])
  end
  # 列出当前用户所拥有的车辆
  def mycars
    @cars = current_user.cars.page params[:page]
    respond_to do |format|
      format.html { render 'mycars'}
      format.json { render json: @cars }
    end
  end

  # 显示车辆详细信息
  def show
    @car = Car.includes(:comments).find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car }
    end
  end

  # 新建车辆
  def new
    @car = Car.new
    @car.build_location
  end

  # 编辑车辆
  def edit
    @car = Car.find(params[:id])
    unless @car.user_id == current_user.id
      render 'mycars'
    end
    render 'edit'
  end

  # 提交车辆信息
  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    respond_to do |format|
      if @car.save
        flash[:notice] = '车辆信息创建成功!'
        format.html { redirect_to @car }
        format.json { render json: @car, status: :created, location: @car }
      else
        format.html { render action: "new" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # 提交修改
  def update
    @car = current_user.cars.find(params[:id])
    respond_to do |format|
      if @car.update_attributes!(car_params)
        format.html { redirect_to @car, notice: '车辆信息修改成功！' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # 删除车辆
  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :no_content }
    end
  end

  def car_params
    params.require(:car).permit(:picture, :description, :brand, :picture, :picture_cache, :location_attributes => [:province, :district, :detail, :city])
  end
  
end
