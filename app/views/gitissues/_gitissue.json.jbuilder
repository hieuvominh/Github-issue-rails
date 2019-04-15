json.extract! gitissue, :id, :name, :content, :link, :created_at, :updated_at
json.url gitissue_url(gitissue, format: :json)
