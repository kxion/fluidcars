class Order
  include Mongoid::Document

  embeds_one :rent
  belongs_to :user

  field :rent_id, type: Moped::BSON::ObjectId
  field :reservation_id, type: Moped::BSON::ObjectId
  field :start, type: DateTime
  field :end, type: DateTime

  before_save :add_reservation_to_rent
  def add_reservation_to_rent
    rent = Rent.find(self.rent_id)
    rs = rent.insert_reservation(self.start, self.end)
    self.reservation_id = rs.id
  end

  before_destroy :remove_reservation_from_rent
  def remove_reservation_from_rent
    rent = Rent.find(self.rent_id)
    rent.cancel_reservation(self.start, self.end)
    Reservation.find(reservation_id).delete
  end

end
