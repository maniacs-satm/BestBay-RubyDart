class Product < ActiveRecord::Base
  attr_accessible :current_price, :description, :owner_id, :start_price, :time_left, :title

  validates :title, presence: true, length: { maximum: 200,
                                              too_long: "title must have at most %{count} characters"}


  validates :start_price, presence: true

end
