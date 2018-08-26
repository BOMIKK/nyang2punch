class AddRegionInfoToMoms < ActiveRecord::Migration
  def change
    add_column :moms, :region, :string
  end
end
