# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    text { Faker::Lorem.sentences }

    association :user

    # factory :link_in_app_academy_sub do |link|
    #   after_create do |link|
    #     create(:app_academy_sub, link: link)
    #   end
    # end
  end
end
