class AddEmailToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :Email, :string
  end
end
