class FixColumNameOfProductUserId < ActiveRecord::Migration
  def change
    rename_column :products, :owner_id, :user_id
  end
end
