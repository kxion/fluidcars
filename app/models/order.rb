class Order < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible
  belongs_to :info
  belongs_to :user
end
