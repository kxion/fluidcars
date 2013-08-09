class Info < ActiveRecord::Base
  attr_accessible :rent_start, :rent_end, :car_id, :price
  validates :rent_start, :rent_end, presence: true
  validates :status, :inclusion => ['active','done','reserved']
  belongs_to :car
  belongs_to :user
  has_one :order
  has_one :rate
  before_save :rent_end_must_great_than_rent_start, :rent_start_cannot_lower_than_now
  private
    def rent_end_must_great_than_rent_start
      if rent_start < rent_end
        return true
      else
        errors.add(:base, '结束时间不能小于开始时间')
        return false
      end
    end

    def rent_start_cannot_lower_than_now
      if rent_start < Time.now.to_date
        errors.add(:base, '开始时间不能小于当前时间')
        return false
      else
        return true
      end
    end
end
 