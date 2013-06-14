class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :mobile
  has_many :cars, dependent: :destroy
  has_many :orders, dependent: :destroy
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true 
  validates :mobile, presence: true, format: { with: /^1[0-9]{10}/ }
end
