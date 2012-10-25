class Bid < ActiveRecord::Base
  attr_accessible :bidding_price, :bidding_time

  belongs_to :user
  belongs_to :product

  validates :bidding_time, presence: true
  validates :bidding_price, presence: true, numericality: true
  validates :user_id, presence: true
  validates :product_id, presence: true

end
