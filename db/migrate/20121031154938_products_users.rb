class ProductsUsers < ActiveRecord::Migration
  def up
  	create_table 'products_users', :id => false do|t|
        t.column :product_id, :integer
        t.column :user_id, :integer
    end
  end

  def down
  end
end
