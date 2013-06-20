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
    @info = Info.includes(:car => {:comments => :user} ).find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @info }
    end
  end

  # GET /infos/new
  # GET /infos/new.json
  def new
    @info = Info.new
    @info.car_id = params[:car_id]
  end

  # GET /infos/1/edit
  def edit
    begin
      @info = Info.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to infos_url
    end
  end

  # POST /infos
  # POST /infos.json
  def create
    @info = Info.new(params[:info])
    if (@info.car.user == current_user)
      @info.user = current_user
      if @info.save
        redirect_to @info, notice: '出租信息发布成功！'
      else
        render action: "new" 
      end
    else
      redirect_to rent_url, notice: 'You have no access to rent this car'
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
    @infos = current_user.infos.includes(:car).order("created_at DESC")
  end

end