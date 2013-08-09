class User < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :mobile
  has_many :cars, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments
  has_many :infos, dependent: :destroy
  has_one :profile
  before_save :email_to_downcase, :create_name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: '邮箱格式不正确' },
                    uniqueness: { case_sensitive: false, message: '此邮箱已经注册' }
  validates :password, length: { minimum: 6, message: '密码不能少于6个字符' }, confirmation: { message: '密码不一致，请重新确认'}
  validates :password_confirmation, presence: true
  validates :mobile, presence: true, uniqueness: { message: '手机号码已注册'}, format: { with: /^1[0-9]{10}$/, message: '请输入格式正确的手机号码'}
  def email_to_downcase
    self.email.downcase!
  end
  def create_name
    self.name = self.email.split('@')[0]
  end
end
