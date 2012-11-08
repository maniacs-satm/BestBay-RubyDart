
FactoryGirl.define do
  # User model
  factory :user do
    name                  "fakeuser"
    email                 "fakeuser@bar.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end
