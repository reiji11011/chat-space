class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end
end
