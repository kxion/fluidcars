# coding: utf-8
class AvatarUploader < ImageUploader

  def default_url
    # You can use FTP to upload a default image
    "http://fluidcars.qiniudn.com/default_avatar.png"
  end
end
