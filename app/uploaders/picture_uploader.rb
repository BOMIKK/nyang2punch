class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
 
  after :remove, :delete_empty_upstream_dirs
  
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  #기본사진설정
def default_url
  # For Rails 3.1+ asset pipeline compatibility:
  ActionController::Base.helpers.asset_path("assets/" + "고양이.jpg")
end

def base_store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
end

 def filename
     if original_filename
         @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
         "#{@name}.jpg"
         
#public에 생기는 사진 디렉토리가 비었을때 그 디렉토리 삭제         
  def delete_empty_upstream_dirs
    path = ::File.expand_path(store_dir, root)
    Dir.delete(path) # fails if path not empty dir

    path = ::File.expand_path(base_store_dir, root)
    Dir.delete(path) # fails if path not empty dir
  rescue SystemCallError
    true # nothing, the dir is not empty
end
end
end
end