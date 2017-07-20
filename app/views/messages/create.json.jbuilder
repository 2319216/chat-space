json.id         @message.id
json.message    @message.message
json.group_id   @message.group.id
json.user_id    @message.user.id
json.user_name  @message.user.name
json.time       @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.image      @message.image.thumb
