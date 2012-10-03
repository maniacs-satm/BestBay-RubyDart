class Product < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :description, :min_price, :name
=======
  attr_accessible :current_price, :description, :owner_id, :start_price, :time_left, :title

  validates :title, presence: true, length: { maximum: 200,
                                              too_long: "title must have at most %{count} characters"}


  validates :start_price, presence: true

>>>>>>> f1b922cb4efd213aea0c4e6ebcfcad22c487350b
end
