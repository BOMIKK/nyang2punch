class AddPictureToCatInfos < ActiveRecord::Migration
  def change
    add_column :cat_infos, :picture, :string
  end
end
