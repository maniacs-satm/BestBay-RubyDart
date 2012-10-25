class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.datetime :bidding_time
      t.float :bidding_price

      t.timestamps
    end
  end
end
