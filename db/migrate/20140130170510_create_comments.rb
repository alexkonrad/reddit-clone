class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent_comment_id
      t.integer :link_id
      t.integer :user_id
      t.string :text

      t.timestamps
    end
  end
end
