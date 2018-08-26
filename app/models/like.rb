class Like < ActiveRecord::Base
  resourcify
  belongs_to :cat_info
  belongs_to :user
end
