# == FactoryGirl for rspec test
#
FactoryGirl.define do
  # User model
  factory :user do
    name                  "fakeuser"
    email                 "fakeuser@bar.com"
    password              "foobar"
    password_confirmation "foobar"
  end

  # Bid model
  factory :bid do
    bidding_price  15
    user_id        1
    product_id     1
  end

  # Product model
  factory :product do
    title          "product test"
    start_price    5
    description    "this is a product test"
    user_id        1
    current_price  18
    category_id    1
    bid_until      "12/28/2012"
  end
  # Category model
  factory :category do
    content "Art"
  end
  # Watchlist model
  factory :watchlist do
    product_id 1
    user_id    1
  end
  # Review model
  factory :review do
    content        "This is a test review"
    user_id   1
    product_id     1
  end

  # Reply model
  factory :reply do
    content       "This is a test review"
    user_id       1
    review_id     1
  end
  
  # Administrator model
  factory :administrator do
    user_id  1
    admin    false
    status   true
  end

end


