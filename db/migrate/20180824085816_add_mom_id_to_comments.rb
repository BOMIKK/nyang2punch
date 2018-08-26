class AddMomIdToComments < ActiveRecord::Migration
  def change
    add_reference :comment_moms, :mom, index: true, foreign_key: true
  end
end
