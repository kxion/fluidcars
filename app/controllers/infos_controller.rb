class InfosController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit, :update, :destroy, :create]
  before_filter :have_car, only: :new
  # GET /infos
  # GET /infos.json
  def index
    @infos = Info.includes(:car).where( "rent_end > ? and status = 'active'", Time.now.to_date).order("created_at DESC").paginate(page: params[:page], per_page: 5)
  end

  # GET /infos/1
  # GET /infos/1.json
  def show
    @info = Info.includes(:rate, car: {comments: :user}).find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @info }
    end
  end

  # GET /infos/1/edit
  def edit
    begin
      @info = Info.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to infos_url
    end
  end

  # PUT /infos/1
  # PUT /infos/1.json
  def update
    @info = Info.find(params[:id])

    respond_to do |format|
      if @info.update_attributes(params[:info])
        format.html { redirect_to @info, notice: 'Info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infos/1
  # DELETE /infos/1.json
  def destroy
    begin
      @info = current_user.infos.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to infos_url
    end
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_url }
      format.json { head :no_content }
    end
  end

  def myinfo
    @infos = current_user.infos.includes(:car, :rate).order("created_at DESC").paginate(page: params[:page], per_page: 5)
  end

  
  def select_car
    @cars = current_user.cars.paginate(page: params[:page], per_page: 5)
    render 'select_car'
  end

  def confirm_select_car
    if Car.find(params[:car_id]).user == current_user
      session[:current_car_id] = params[:car_id] 
      redirect_to select_time_url
    else
      flash[:notice] = '只能出租属于自己的车辆'
      redirect_to select_car_url
    end
  end

  def select_time
    @info = Info.new
  end

  def confirm_select_time
    @info = current_user.infos.build(params[:info])
    @info.car_id = session[:current_car_id]
    if @info.save
      session[:current_info_id] = @info.id
      redirect_to set_rates_url
    else
      render 'select_time'
    end
  end

  def set_rates
    @rate = Rate.new
  end

  def confirm_set_rates
    @rate = Rate.new(params[:rate])
    @rate.info_id = session[:current_info_id]
    @rate.save
    redirect_to complete_url
  end

  def complete
    @info = Info.find(session[:current_info_id])   
    session[:current_info_id] = nil
    session[:current_car_id] = nil 
  end

end