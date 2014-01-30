# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.sentences }
    association :parent_comment, factory: :comment
    association :link
    association :user
  end
end
