json.array!(@authors) do |author|
  json.extract! author, :id, :email, :first_name, :last_name
  json.url author_url(author, format: :json)
end
