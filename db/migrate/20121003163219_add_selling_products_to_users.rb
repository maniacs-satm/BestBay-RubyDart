class AddSellingProductsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :selling_products, :array
  end
end
