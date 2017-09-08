class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def create
  end
end
