class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]

  def index
    @messages = @group.messages.order('created_at DESC')
    @message = Message.new
  end

  def create
    @message = @group.messages.new(create_params)
    if @message.save
      redirect_to group_messages_path
    else
      render :index, notice: "メッセージを入力してください"
    end
  end

  private

  def create_params
    params.require(:message).permit(:message,:image).merge(user_id: current_user.id,group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end