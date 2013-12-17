class Profile
  include Mongoid::Document

  mount_uploader :avatar, AvatarUploader
  
  embedded_in :user
  embeds_many :locations, as: :addressable

  field :name, type: String
  field :avatar, type: String
  field :avatar_cache, type: String
  field :contact, type: String
  
end
