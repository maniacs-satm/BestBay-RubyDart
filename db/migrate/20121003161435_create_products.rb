class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.float :start_price
      t.string :description
      t.integer :owner_id
      t.integer :time_left
      t.float :current_price

      t.timestamps
    end
  end
end
