# encoding: utf-8

class PictureUploader < ImageUploader

  # Override the filename of the uploaded files:
  def filename
    if super.present?
      # current_path 是 Carrierwave 上传过程临时创建的一个文件，有时间标记，所以它将是唯一的
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension.downcase}"
    end
  end

  def default_url
    # You can use FTP to upload a default image
    "http://fluidcars.b0.upaiyun.com/car.jpg#{version_name}"
  end
end
