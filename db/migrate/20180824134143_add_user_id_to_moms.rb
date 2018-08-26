class AddUserIdToMoms < ActiveRecord::Migration
  def change
    add_column :moms, :user_id, :integer
    add_index :moms, :user_id
  end
end
