class Car
  include Mongoid::Document
  include BaiduMap

  mount_uploader :picture, PictureUploader
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  embeds_one :location

  accepts_nested_attributes_for :location

  field :picture, type: String # 车辆图片
  field :description, type: String # 车辆描述
  field :brand, type: String # 车辆品牌型号

  validates :description, :brand, presence: true
  before_save :gps_from_baidu_map

end
