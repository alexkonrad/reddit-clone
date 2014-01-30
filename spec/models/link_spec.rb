require 'spec_helper'

describe Link do
  let(:link) { FactoryGirl.create(:link) }

  it { should belong_to(:user) }
end
