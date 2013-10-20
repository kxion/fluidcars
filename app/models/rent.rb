class Rent
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include BaiduMap

  embeds_one :car
  belongs_to :user
  has_many :reservations
  
  field :rate, type: Hash # 出租费率，分别是日，周，月费率 
  field :start, type: Date # 出租开始时间
  field :end, type: Date # 出租结束时间
  field :period_type, type: String, default: 'short' #出租类型，long(长租)or short(短租)

  def reserved?(o_start, o_end)
    res = self.reservations.find_from_range(o_start, o_end).first
    res.nil?||(res.status == '已预订')
  end

  def insert_reservation(o_start, o_end)
    origin_res = self.reservations.find_from_range(o_start, o_end).first
    if o_start == origin_res.start
      unless o_end == origin_res.end
        self.reservations.create(start: o_end + 1.day, end: origin_res.end)
      end
    elsif o_end == origin_res.end
      self.reservations.create(start: origin_res.start, end: o_start - 1.day)
    else
      self.reservations.create(start: origin_res.start, end: o_start - 1.day)
      self.reservations.create(start: o_end + 1.day, end: origin_res.end)
    end
    origin_res.delete
    self.reservations.create(start: o_start, end: o_end, status: '已预订')
  end

end
