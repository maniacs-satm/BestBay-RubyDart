class RenameFromUserIdToUserIdInReview < ActiveRecord::Migration
  def change
    rename_column :reviews, :from_user_id, :user_id
  end
end
