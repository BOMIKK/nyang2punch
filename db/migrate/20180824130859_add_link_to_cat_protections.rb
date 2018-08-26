class AddLinkToCatProtections < ActiveRecord::Migration
  def change
    add_column :cat_protections, :link, :string
  end
end
