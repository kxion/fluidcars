class Comment
  include Mongoid::Document
  mount_uploader :user_avatar, AvatarUploader
  belongs_to :car

  field :content, type: String
  field :score, type: Integer
  field :user_name, type: String
  field :user_avatar, type: String
end
