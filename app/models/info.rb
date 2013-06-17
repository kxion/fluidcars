class Info < ActiveRecord::Base
  attr_accessible :rent_start, :rent_end, :car_id, :price
  validates :rent_start, :rent_end, presence: true
  validates :status, :inclusion => ['active','done','reserved']
  belongs_to :car
  belongs_to :user
  has_one :order
  before_save :rent_end_must_great_than_rent_start, :rent_start_cannot_lower_than_now
  private
    def rent_end_must_great_than_rent_start
      if rent_start < rent_end
        return true
      else
        errors.add(:base, 'rent_end cannot before rent_start')
        return false
      end
    end

    def rent_start_cannot_lower_than_now
      if rent_start < Time.now.to_date
        errors.add(:base, 'rent_start cannot be lower than now')
        return false
      else
        return true
      end
    end
end
 