require 'spec_helper'

feature "sign up" do
  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signs up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: "test_user"
      fill_in 'password', with: "biscuits"
      click_on "Sign Up"
    end

    it "redirects to index page after signup" do
      expect(page).to have_content "Index"
    end

    it "shows username on the home page after signup" do
      expect(page).to have_content "test_user"
    end
  end
end

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