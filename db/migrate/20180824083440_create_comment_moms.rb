class CreateCommentMoms < ActiveRecord::Migration
  def change
    create_table :comment_moms do |t|
      t.belongs_to :mom
      t.string :content

      t.timestamps null: false
    end
  end
end
