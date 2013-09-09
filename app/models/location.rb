class Location
  include Mongoid::Document

  embedded_in :car

  field :province, type: String
  field :city, type: String
  field :district, type: String
  field :detail, type: String
  field :gps, type: Array

end
