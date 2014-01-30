class Link < ActiveRecord::Base
  attr_accessible :text, :title, :url, :user_id

  belongs_to :user

  has_many :link_subs
  has_many :subs, through: :link_subs, source: :sub
  has_many :comments

  def comments_by_parent_id
    hash = {}

    comments.each do |comment|
      hash[comment.id] = comments
                   .select { |com| comment.id == com.parent_comment_id }
    end

    hash
  end
end
