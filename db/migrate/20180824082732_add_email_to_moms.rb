class AddEmailToMoms < ActiveRecord::Migration
  def change
    add_column :moms, :Email, :string
  end
end
