FactoryGirl.define do
  factory :trace do
    executed_on { Time.now }
    count { rand(100) }
    item
  end
end
