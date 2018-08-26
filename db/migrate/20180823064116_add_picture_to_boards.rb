class AddPictureToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :picture, :string
  end
end
