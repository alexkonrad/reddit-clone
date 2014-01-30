require 'spec_helper'

describe UserVote do
  subject (:user_vote) { FactoryGirl.create(:user_vote) }

  # TODO: figure out why this doesn't work
  xit { should validate_uniqueness_of(:link_id).scoped_to(:user_id) }
  it { should ensure_inclusion_of(:vote).in_array(%w[up down]) }

  it { should belong_to(:user) }
  it { should belong_to(:link) }
end
