class Link < ActiveRecord::Base
  attr_accessible :text, :title, :url, :user_id

  belongs_to :user

  has_many :link_subs
  has_many :subs, through: :link_subs, source: :sub
  has_many :comments
end
