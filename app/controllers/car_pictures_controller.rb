class CarPicturesController < ApplicationController
  def destroy
    car = Car.find(params[:car_id])
    @pic = car.car_pictures.find(params[:id])
    @pic.destroy
    respond_to do |format|
      format.js
    end
  end
end
