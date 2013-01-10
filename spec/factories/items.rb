FactoryGirl.define do
  factory :item do
    user
    name { Faker::Lorem.sentence(1) }
  end
end
