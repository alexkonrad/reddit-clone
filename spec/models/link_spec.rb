require 'spec_helper'

describe Link do
  let(:link) { FactoryGirl.create(:link) }

  it { should validate_presence_of(:user) }

  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_many(:subs).through(:link_subs) }

  describe "#comments_by_parent_id" do
    let(:parent) { FactoryGirl.create(:comment, link: link) }
    let(:child) { FactoryGirl.create(:comment, parent_comment: parent, link: link) }

    it "should return a hash of all the child comments" do
      hash = { parent.id => [child], child.id => [] }

      expect(link.comments_by_parent_id).to eq(hash)
    end
  end
end
