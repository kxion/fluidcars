class Location
  include Mongoid::Document

  embedded_in :car

  field :province, type: String
  field :city, type: String
  field :district, type: String
  field :detail, type: String
  field :gps, type: Array

  validates :province, :city, :district, :detail, presence: { message: '请填写'}

end
