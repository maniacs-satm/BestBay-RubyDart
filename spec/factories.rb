
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
    bidding_time   "2012-11-08 05:03:35"
    bidding_price  15
    user_id        1
    product_id     1
  end
end
