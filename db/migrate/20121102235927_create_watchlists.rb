class CreateWatchlists < ActiveRecord::Migration
  def change
    create_table :watchlists do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
    add_index :watchlists, [:user_id, :created_at]
  end
end
