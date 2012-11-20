class RemoveToUserIdFromReview < ActiveRecord::Migration
  def up
    remove_column :reviews, :to_user_id
  end

  def down
    add_column :reviews, :to_user_id, :integer
  end
end
