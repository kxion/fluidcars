# encoding: utf-8

class PictureUploader < ImageUploader

  def default_url
    # You can use FTP to upload a default image
    "http://fluidcars.b0.upaiyun.com/car.jpg#{version_name}"
  end
  
end
