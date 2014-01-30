require 'spec_helper'

feature "sign up" do
  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signs up a user" do
    before(:each) do
      visit new_user_url
      sign_up_as_alex
    end

    it "redirects to index page after signup" do
      expect(page).to have_content "Index"
    end

    it "shows username on the home page after signup" do
      expect(page).to have_content "alex"
    end
  end
end

#
# TODO: replace FactoryGirl mocks with helper methods to navigate
# the site with Capybara
#
feature "show user" do
  before(:each) do
    let(:user) { FactoryGirl.create(:user, password: "amkamk") }
    let(:sub) { FactoryGirl.create(:sub, moderator: user) }
    let(:link) { FactoryGirl.create(:link, user: user) }

    visit user_url(user)
  end

  it "shows username" do
    expect(page).to have_content(user.username)
  end

  it "shows any subs belonging to the user" do
    expect(page).to have_content(sub.name)
  end

  it "shows any links belonging to the user" do
    expect(page).to have_content(link.title)
  end
end

#
# TODO: replace FactoryGirl mocks with helper methods to navigate
# the site with Capybara
#

feature "edit user" do
  before(:each) do
    let(:user) { FactoryGirl.create(:user, password: amkamk) }
    sign_in(user)

    visit edit_user_url(user)
  end

  it "shows user information" do
    expect(page).to have_content(user.username)
  end

  it "updates user information" do
    fill_in 'username', with: "fontaine"
    click_button('Update User')

    expect(page).to have_content("fontaine")
  end
end