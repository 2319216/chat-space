class GroupsController < ApplicationController

  before_action :move_to_sign_in, except: :new

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました。'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: 'チャットグループが更新されました'
    else
      render :edit
    end
  end

  def index
    @groups = current_user.groups
  end

  private

  def group_params
     params.require(:group).permit(:name, user_ids: [])
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

end
