class Location
  include Mongoid::Document

  field :city, type: String
  field :district, type: String
  field :detail, type: String
  field :gps, type: Array

end
