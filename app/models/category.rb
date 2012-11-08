# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :content
  has_many :products

  validates :content, presence: true 
end
