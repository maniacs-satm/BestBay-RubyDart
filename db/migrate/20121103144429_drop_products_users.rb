class DropProductsUsers < ActiveRecord::Migration
  def up
  	drop_table :products_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
