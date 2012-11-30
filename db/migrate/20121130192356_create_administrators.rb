class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.integer :user_id
      t.boolean :status
      t.boolean :admin

      t.timestamps
    end
  end
end
