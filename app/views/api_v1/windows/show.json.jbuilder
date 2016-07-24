json.data do
    json.comment_count @comments.count
    json.array! @comments do |comment|
      json.comment_id comment.id
      json.conent comment.content
      json.time comment.updated_at
      json.username comment.user.username
      json.avatar_url asset_url("comment.user.avatar.url")
  end
end