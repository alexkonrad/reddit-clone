# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_vote do
    vote { %w[up down].sample }
    association :link
    association :user
  end
end
