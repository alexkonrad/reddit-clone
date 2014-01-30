class AddIndicesToUserVoteTable < ActiveRecord::Migration
  def change
    add_index :user_votes, [:user_id, :link_id], unique: true
  end
end
