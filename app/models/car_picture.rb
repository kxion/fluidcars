class CarPicture
  include Mongoid::Document

  embedded_in :car
  mount_uploader :picture, PictureUploader
  field :picture, type: String
  field :picture_cache, type: String
  
end
