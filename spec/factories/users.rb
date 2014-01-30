# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    password { Faker::Internet.password }

    factory :user_with_sub do
      after_create do |user|
        create(:sub, moderator: user)
      end
    end

    factory :user_with_links do
      after_create do |user|
        create(:link, user: user)
      end
    end
  end
end
