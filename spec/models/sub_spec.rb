require 'spec_helper'

describe Sub do
  let(:sub) { FactoryGirl.create(:sub) }

  it { should validate_presence_of(:name) }
  it { should belong_to(:moderator) }
  # it { should have_many(:links) }
end
