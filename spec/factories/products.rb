# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title "MyString"
    start_price ""
    description "MyString"
    owner_id 1
    time_left "MyString"
    integer "MyString"
    current_price ""
  end
end
