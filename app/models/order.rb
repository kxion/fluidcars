class Order
  include Mongoid::Document

  embeds_one :rent
  belongs_to :user

  field :rent_id, type: Moped::BSON::ObjectId
  field :reservation_id, type: Moped::BSON::ObjectId
  field :start, type: Date
  field :end, type: Date

  before_save :add_reservation_to_rent
  def add_reservation_to_rent
    rent = Rent.find(self.rent_id)
    rs = rent.reservations.build(:start => self.start, :end => self.end)
    self.reservation_id = rs.id
    rs.save
  end

  before_destroy :remove_reservation_from_rent
  def remove_reservation_from_rent
    Reservation.find(self.reservation_id).destroy
  end

end
