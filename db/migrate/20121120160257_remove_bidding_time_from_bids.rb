class RemoveBiddingTimeFromBids < ActiveRecord::Migration
  def up
    remove_column :bids, :bidding_time
  end

  def down
    add_column :bids, :bidding_time, :datetime
  end
end
