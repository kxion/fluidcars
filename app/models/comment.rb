class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :content, :car_id
  belongs_to :car
  belongs_to :user
end
