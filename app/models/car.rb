class Car
  include Mongoid::Document
  include BaiduMap
  
  belongs_to :user
  has_many :comments, dependent: :destroy

  embeds_many :car_pictures, cascade_callbacks: true
  embeds_one :location

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :car_pictures, allow_destroy: true

  field :description, type: String # 车辆描述
  field :brand, type: String # 车辆品牌型号

  validates :description, :brand, presence: true
  before_save :gps_from_baidu_map

end
