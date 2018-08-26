class Board < ActiveRecord::Base
    resourcify
    belongs_to :users
    mount_uploader :picture, PictureUploader
    #paginates_per 12
  
end
