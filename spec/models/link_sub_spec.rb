require 'spec_helper'

describe LinkSub do
  let(:link_sub) { FactoryGirl.create(:link_sub) }

  it { should belong_to(:sub) }
  it { should belong_to(:link) }
end
