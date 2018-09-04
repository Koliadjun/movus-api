class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :updated_at
end
