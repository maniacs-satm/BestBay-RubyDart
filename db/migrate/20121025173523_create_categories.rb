class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :content
      t.integer :product_id

      t.timestamps
    end
    add_index :categories, [:product_id, :created_at]
  end
end
