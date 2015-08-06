class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :tags, :company, :picture, :is_active, :id_book

  has_one :author, serializer: AuthorPreviewSerializer
  has_many :comments, serializer: CommentPreviewSerializer
end
