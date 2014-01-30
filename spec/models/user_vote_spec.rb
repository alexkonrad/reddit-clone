require 'spec_helper'

describe UserVote do
  #subject (:user_vote) { FactoryGirl.create(:user_vote, link_id: 1, user_id: 1) }

  #it { should validate_uniqueness_of(:link_id).scoped_to(:user_id) }
  it "jdsklf" do
    UserVote.create!(link_id: 1, user_id: 1, vote: "up")
    should validate_uniqueness_of(:user_id)
  end
  it { should ensure_inclusion_of(:vote).in_array(%w[up down]) }

  it { should belong_to(:user) }
  it { should belong_to(:link) }
end
