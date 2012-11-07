# == Schema Information
#
# Table name: bids
#
#  id            :integer          not null, primary key
#  bidding_time  :datetime
#  bidding_price :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  product_id    :integer
#

# Rdoc for Bid table
#
# == Bidding
#
# This is a heading

class Bid < ActiveRecord::Base
  attr_accessible :bidding_price, :bidding_time

  belongs_to :user
  belongs_to :products

  validates :bidding_time, presence: true
  validates :bidding_price, presence: true, numericality: true
  validates :user_id, presence: true
  validates :product_id, presence: true

end
