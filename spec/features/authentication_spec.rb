require 'spec_helper'

feature "Sign out" do
  it "has a sign out button" do
    sign_up_as_alex
    page.should have_button 'Sign Out'
  end

  it "logs a user out on click" do
    sign_up_as_alex

    click_button 'Sign Out'
    visit '/posts'

    # redirect to login page
    page.should have_content 'Sign In'
  end
end

feature "Sign in" do
  it "has a sign in page" do
    visit "/session/new"
    page.should have_content "Sign In"
  end

  it "takes a username and password" do
    visit "/session/new"
    page.should have_content "Username"
    page.should have_content "Password"
  end

  it "returns to sign in on failure" do
    visit "/session/new"
    fill_in "Username", with: 'alex'
    fill_in "Password", with: 'hello'
    click_button "Sign In"

    # return to sign-in page
    page.should have_content "Sign In"
  end

  it "takes a user to posts index on success" do
    sign_up_as_alex
    # add button to sign out in application.html.erb layout
    click_button 'Sign Out'

    # Sign in as newly created user
    visit "/session/new"
    fill_in "Username", with: 'alex'
    fill_in "Password", with: 'abcdef'
    click_button "Sign In"
    page.should have_content "alex"
  end
end
