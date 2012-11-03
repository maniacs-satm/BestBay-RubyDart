class Product < ActiveRecord::Base
  attr_accessible :current_price, :description, :user_id, :start_price, :time_left, :title, :image, :user_name, :category_id
  has_attached_file :image, :styles => {
      :thumb=> "250x300#",
      :small  => "600x600>" }


  belongs_to :user
  belongs_to :category
  has_many   :bids

  
  validates :title, presence: true, length: { maximum: 200,
                                              too_long: "title must have at most %{count} characters"}
  validates :start_price, presence: true
  validates :category_id, presence:true

  

  #has_and_belongs_to_many :users
  has_many :watchlists
end
