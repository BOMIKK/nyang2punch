class AddUserIdToCommentMoms < ActiveRecord::Migration
  def change
    add_column :comment_moms, :user_id, :integer
    add_index :comment_moms, :user_id
  end
end
