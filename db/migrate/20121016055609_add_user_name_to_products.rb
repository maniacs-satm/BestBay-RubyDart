class AddUserNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :user_name, :string
  end
end
