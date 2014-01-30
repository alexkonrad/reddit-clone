# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link_sub do
    association :sub
    association :link

    # factory :app_academy_sub do
    #   after_create do |link_sub|
    #     create(:sub, name: "App Academy")
    #   end
    # end
    #
    # factory :cats_link do
    #   after_create do |link_sub|
    #     create(:link, url: "http://cats.com",
    #                   title: "Cats",
    #                   text: "check out these cats!")
    #   end
    # end
  end
end
