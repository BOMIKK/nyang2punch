json.extract! cat_info, :id, :title, :content, :created_at, :updated_at
json.url cat_info_url(cat_info, format: :json)
