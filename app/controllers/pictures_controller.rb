class PicturesController < ApplicationController

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
        format.json {
          render :json => @picture.output_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def pic_params
    params.require(:picture).permit(:image, :image_cache, :car_id)
  end

end
