class Location
  include Mongoid::Document
  include BaiduMap

  embedded_in :addressable, polymorphic: true

  field :province, type: String
  field :city, type: String
  field :district, type: String
  field :detail, type: String
  field :gps, type: Array

  validates :province, :city, :district, :detail, presence: { message: '请填写'}

  before_save :get_gps_from_baidu_map

  def format_location
    self.city + self.district + self.detail
  end

end
