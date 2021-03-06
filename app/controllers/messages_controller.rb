class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash.now[:alert] = 'メッセージ内容を入力してください'
      render action: :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end
end
