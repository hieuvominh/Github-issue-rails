class Gitissue
  include Mongoid::Document
  field :name, type: String
  field :content, type: String
  field :link, type: String
end
