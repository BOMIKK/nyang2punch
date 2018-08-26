class CatProtection < ActiveRecord::Base
    belongs_to :users
    mount_uploader :picture, PictureUploader
end
