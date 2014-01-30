# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.sentences.join }
    association :link
    association :user
  end
end
