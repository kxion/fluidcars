class Reservation
  include Mongoid::Document

  belongs_to :rent
  
  field :start, type: Date
  field :end, type: Date

end
