class Info < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader
  # attr_accessible :title, :body
  attr_accessible :rent_start, :rent_end, :description, :location, :price, :avatar
  validates :rent_start, :rent_end, :description, :location, :price, presence:true
  validates :price, numericality: {greater_than: 0.01}
  belongs_to :user

end
 