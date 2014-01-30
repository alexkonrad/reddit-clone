class UserVote < ActiveRecord::Base
  attr_accessible :link_id, :user_id, :vote

  # validates_uniqueness_of :user_id, scope: :link_id
  validates :user_id, uniqueness: { scope: :link_id }
  validates :vote, inclusion: { in: %[up down] }

  belongs_to :user
  belongs_to :link
end
