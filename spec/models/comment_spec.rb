require 'spec_helper'

describe Comment do
  let(:comment) { FactoryGirl.create(:comment) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:link) }
  it { should validate_presence_of(:text) }

  it { should belong_to(:user) }
  it { should belong_to(:link) }
  it { should belong_to(:parent_comment) }

  it { should have_many(:comments) }
end
