class AddUserIdToCatInfo < ActiveRecord::Migration
  def change
    add_column :cat_infos, :user_id, :integer
    add_index :cat_infos, :user_id
  end
end
