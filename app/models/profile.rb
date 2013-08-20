class Profile
  include Mongoid::Document

  attr_accessible :avatar, :avatar_cache, :nickname

  mount_uploader :avatar, AvatarUploader
  
  embedded_in :user

  field :nickname, type: String
  field :avatar, type: String
  
end
