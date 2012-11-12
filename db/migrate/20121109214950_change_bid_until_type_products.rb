class ChangeBidUntilTypeProducts < ActiveRecord::Migration
  def change
    change_column :products, :bid_until, :string
  end
end
