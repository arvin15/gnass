class CommentSerializer < ActiveModel::Serializer

  attributes :id, :message, :document_id

  has_one :document, serializer: DocumentPreviewSerializer
end
