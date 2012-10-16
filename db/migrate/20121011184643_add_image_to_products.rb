class AddImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_file_name, :string rescue nil   #add rescue nil to avoid duplicated column error
    add_column :products, :image_content_type, :string rescue nil   #don't delete this
    add_column :products, :image_file_size, :integer rescue nil
  end
end
