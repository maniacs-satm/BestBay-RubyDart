class ChangeTimeLeftToProduct < ActiveRecord::Migration
  def change
    rename_column :products, :time_left, :bid_until
    change_column :products, :bid_until, :datetime
  end
end
