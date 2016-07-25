json.data do
  json.comments_count @comments.count
end

json.comments do
  json.array! @comments do |comment|
    json.comment_id comment.id
    json.conent comment.content
    json.time comment.updated_at
    json.username comment.user.try(:username)
    json.avatar_url asset_url (comment.user.try(:show_avatar))
  end
end