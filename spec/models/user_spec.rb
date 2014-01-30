require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }

  it { should validate_presence_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }

  it { should have_many(:subs) }
  it { should have_many(:links)}

  it "does not store the password in the database" do
    saved_user = User.find_by_username(user.username)

    expect(saved_user.password).to be_nil
  end

  # context "Moderator" do
  #   let(:user_with_sub) { FactoryGirl.create(:user_with_sub) }
  #
  #   it { should have_many(:subs) }
  # end
  #
  # context "User links" do
  #   let(:user_with_links) { FactoryGirl.create(:user_with_links) }
  #
  #   it { should have_many(:links) }
  # end
end