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

require 'spec_helper'

describe Bid do

  it { should respond_to(:bidding_time) }
  it { should respond_to(:bidding_price) }
  it { should respond_to(:user_id) }
  it { should respond_to(:product_id) }
  it { should be_valid }

  describe "when bidding_price is not present" do
    before { @bid.bidding_price = nil }
    it { should_not be_valid }
  end


end
