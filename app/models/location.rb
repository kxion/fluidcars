class Location
  include Mongoid::Document
  attr_accessible :city, :district, :detail, :gps

  field :city, type: String
  field :district, type: String
  field :detail, type: String
  field :gps, type: Array

end
