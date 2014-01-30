class Link < ActiveRecord::Base
  attr_accessible :text, :title, :url, :user_id

  validates :user, presence: true

  belongs_to :user

  has_many :link_subs
  has_many :subs, through: :link_subs, source: :sub
  has_many :comments
  has_many :user_votes

  def comments_by_parent_id
    hash = {}

    comments.each do |comment|
      hash[comment.id] = comments
                   .select { |com| comment.id == com.parent_comment_id }
    end

    hash
  end
end
