class CreateMoms < ActiveRecord::Migration
  def change
    create_table :moms do |t|
      t.string :title
      t.text :content
      t.string :picture
      t.integer :impression_count

      t.timestamps null: false
    end
  end
end
