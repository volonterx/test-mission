FactoryGirl.define do
  factory :profile do
    country "Ukraine"
    dob Date.today - 20.years
  end
end
