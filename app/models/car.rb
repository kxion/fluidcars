class Car < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader
  attr_accessible :band, :description, :location, :price, :avatar, :avatar_cache, :city
  validates :description, :city, :location, presence:true
  # validates :price, numericality: { greater_than: 0.01 }
  belongs_to :user
  has_many :infos, dependent: :destroy
  has_many :comments, dependent: :destroy
end
