class Category < ActiveRecord::Base
  attr_accessible :content
  has_many :products

  validates :content, presence: true 
end
