json.array!(@documents) do |document|
  json.extract! document, :id, :title, :body, :tags, :company, :picture, :is_active, :id_book, :author_id
  json.url document_url(document, format: :json)
end
