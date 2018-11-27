class Restaurant < ActiveRecord::Base 
  has_many :meals
  belongs_to :user
end 