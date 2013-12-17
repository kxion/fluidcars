class Car
  include Mongoid::Document
  include BaiduMap
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :pictures, autosave: true
  embeds_one :location, as: :addressable, cascade_callbacks: true
  # accepts_nested_attributes_for :location

  field :description, type: String # 车辆描述
  field :brand, type: String # 车辆品牌型号
  field :token, type: String

  validates :description, :brand, presence: {message: '不能为空'}

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token if Car.find(token: random_token).nil?
    end
  end
end
