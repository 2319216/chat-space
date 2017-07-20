json.array! @messages do |message|
  json.user_name message.user.name
  json.time message.created_at.strftime("%Y/%m/%d %H:%M:%S")
  json.message message.message
  json.image message.image.url
end
