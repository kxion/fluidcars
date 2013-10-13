class Order
  include Mongoid::Document

  embeds_one :rent
  belongs_to :user

  field :rent_id, type: Moped::BSON::ObjectId

  before_save :change_rent_reserved

  def change_rent_reserved
    self.rent.status = '已预订'
  end

  before_destroy do |order|
    rent = Rent.find(order.rent_id)
    rent.status = '可预订'
    rent.save
  end

end
