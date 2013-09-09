# coding: utf-8
class AvatarUploader < ImageUploader

  def filename
    if super.present?
      "avatar/#{file.extension.downcase}"
    end
  end

  def default_url
    # You can use FTP to upload a default image
    "http://fluidcars.b0.upaiyun.com/face.png#{version_name}"
  end
end
