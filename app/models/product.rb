# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  start_price        :float
#  description        :string(255)
#  user_id            :integer
#  time_left          :integer
#  current_price      :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  user_name          :string(255)
#  category_id        :integer
#

class Product < ActiveRecord::Base
  attr_accessible :current_price, 
                  :description, 
                  :user_id, 
                  :user_name,  
                  :start_price, 
                  :bid_until, 
                  :title, 
                  :image, 
                  :category_id

  has_attached_file :image, :styles => {
                            :thumb=> "250x300#",
                            :small  => "600x600>" }

  belongs_to :user
  belongs_to :category
  has_many   :bids
  has_many   :watchlists

  validates :title, presence: true, 
            length: { maximum: 200,
                      too_long: "title must have at most %{count} characters"}

  validates :start_price, presence: true
  validates :category_id, presence:true
  validates :user_id, presence:true
end
