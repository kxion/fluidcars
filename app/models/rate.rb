class Rate < ActiveRecord::Base
  attr_accessible :day, :week, :month
  belongs_to :info

end
