class PicturesController < ApplicationController

 
  def index
    @car = Car.find(params[:car_id])
    @pictures = @car.pictures
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures.map{|picture| picture.output_json} }
    end
  end

  def destroy
    @pic = Picture.find(params[:id])
    @pic.destroy
    respond_to do |format|
      format.js
    end
  end

  def create
    @picture = Picture.new(pic_params)
    if @picture.save
      respond_to do |format|
        format.html {
          render :json => @picture.output_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: { files: [@picture.output_json]}, status: :created, location: @picture }
        format.js
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def pic_params
    params.require(:picture).permit(:image, :image_cache, :car_id)
  end

end
