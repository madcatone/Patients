json.array!(@comments) do |comment|
  json.extract! comment, :id, :title, :context
  json.url comment_url(comment, format: :json)
end
