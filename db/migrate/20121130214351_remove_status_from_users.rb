class RemoveStatusFromUsers < ActiveRecord::Migration
  def up
      remove_column :users, :active
  end

  def down
  end
end
