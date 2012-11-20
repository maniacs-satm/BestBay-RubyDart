# == Schema Information
#
# Table name: bids
#
#  id            :integer          not null, primary key
#  bidding_price :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  product_id    :integer
#

class Bid < ActiveRecord::Base
  attr_accessible :bidding_price, :user_id, :product_id

  belongs_to :user
  belongs_to :products

  validates :bidding_price, presence: true, numericality: true
  validates :user_id, presence: true
  validates :product_id, presence: true

end
