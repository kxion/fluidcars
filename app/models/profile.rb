class Profile < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :face, FaceUploader
  belongs_to :user
  attr_accessible :face, :face_cache
end
