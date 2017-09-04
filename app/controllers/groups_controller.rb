class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_url, notice: 'グループを作成しました'
    else
      render new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def upadate
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
