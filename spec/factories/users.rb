FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'pizza' }
  end
end
