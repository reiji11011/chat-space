class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

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
  end

  def update
    if @group.update(group_params)
      redirect_to root_url, notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
