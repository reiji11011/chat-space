class MessagesController < ApplicationController
  before_action :initial_value, only: [:index, :create]

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      render action: :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end

  def initial_value
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
  end
end
