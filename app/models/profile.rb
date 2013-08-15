class Profile
  include Mongoid::Document

  attr_accessible :avatar, :avatar_cache, :nickname

  mount_uploader :avatar, AvatarUploader

  field :nickname, type: String
  field :avatar, type: String
  embedded_in :user
end
