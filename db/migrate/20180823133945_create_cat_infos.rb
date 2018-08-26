class CreateCatInfos < ActiveRecord::Migration
  def change
    create_table :cat_infos do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
