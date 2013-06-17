class User < ActiveRecord::Base
  # attr_accessible :title, :body
  require 'carrierwave/orm/activerecord'
  mount_uploader :face, FaceUploader
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :mobile, :face, :face_cache
  has_many :cars, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments
  has_many :infos, dependent: :destroy
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false, message: '此邮箱已经注册' }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true 
  validates :mobile, presence: true, uniqueness: { message: '手机号码已注册'}, format: { with: /^1[0-9]{10}/, message: "请输入正确的手机号码" }
end
