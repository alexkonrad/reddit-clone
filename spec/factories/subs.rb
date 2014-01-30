# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    name { Faker::Lorem.words.take(1) }
    association :moderator, factory: :user
  end
end
