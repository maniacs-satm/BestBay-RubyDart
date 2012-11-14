class ChangeTimeLeftToProduct < ActiveRecord::Migration
  def change
    rename_column :products, :time_left, :bid_until
  end
end
