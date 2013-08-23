class Rent
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include BaiduMap

  embeds_one :car
  belongs_to :user
  mount_uploader :onwer_avatar, AvatarUploader

  field :rate, type: Hash # 出租费率，分别是日，周，月费率 
  field :start, type: Date # 出租开始时间
  field :end, type: Date # 出租结束时间
  field :status, type: String, default: 'active' # 出租状态
  field :onwer_name, type: String
  field :onwer_avatar, type: String
  field :period_type, type: String #出租类型，long(长租)or short(短租)
end
