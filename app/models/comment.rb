class Comment < ActiveRecord::Base
  attr_accessible :link_id, :parent_comment_id, :text, :user_id

  validates :text, :user, :link, presence: true

  belongs_to :link
  belongs_to :user
  belongs_to(
    :parent_comment,
    class_name: "Comment",
    foreign_key: :parent_comment_id,
    primary_key: :id
  )

  has_many(
    :comments,
    class_name: "Comment",
    foreign_key: :parent_comment_id,
    primary_key: :id
  )
end
