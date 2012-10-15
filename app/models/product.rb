class Product < ActiveRecord::Base
  attr_accessible :current_price, :description, :owner_id, :start_price, :time_left, :title,  :image
  has_attached_file :image, :styles => {
      :thumb=> "100x100#",
      :small  => "400x400>" }

  validates :title, presence: true, length: { maximum: 200,
                                              too_long: "title must have at most %{count} characters"}


  validates :start_price, presence: true

end
