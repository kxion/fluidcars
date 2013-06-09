class Info < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader
  # attr_accessible :title, :body
  attr_accessible :rent_start, :rent_end, :description, :location, 
                  :price, :avatar, :avatar_cache, :city
  validates :rent_start, :rent_end, :description, :location, :price, presence:true
  validates :price, numericality: {greater_than: 0.01}
  belongs_to :user
  before_save :rent_end_must_great_than_rent_start
  private
    def rent_end_must_great_than_rent_start
      if rent_start < rent_end
        return true
      else
        errors.add(:base,'rent_end cannot before rent_start')
        return false
      end
    end
end
 