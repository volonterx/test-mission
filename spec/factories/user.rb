FactoryGirl.define do
  factory :user do
    email "new_user@example.com"
    password  "password"
    password_confirmation  "password"
  end
end
