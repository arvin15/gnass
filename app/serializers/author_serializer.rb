class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name

  has_many :documents, serializer: DocumentPreviewSerializer
end
