class UserVote < ActiveRecord::Base
  attr_accessible :link_id, :user_id, :vote

  validates :user_id, uniqueness: { scope: :link_id }
  validates :vote, inclusion: { in: %[up down] }

  belongs_to :user
  belongs_to :link
end
