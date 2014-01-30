# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    name { Faker::Lorem.words.take(1) }
    association :moderator, factory: :user

    # factory :cat_sub_with_cat_link do
    #   after_create do |sub|
    #     create(:cats_link, sub: sub)
    #   end
    # end
  end
end
