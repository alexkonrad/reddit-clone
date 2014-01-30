class RenameUserIdColumnToSubIdColumnInLinkSubsTable < ActiveRecord::Migration
  def change
    rename_column :link_subs, :user_id, :sub_id
  end
end
