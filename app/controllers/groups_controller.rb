class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to root_path,notice: 'グループを作成しました。'
    else
      render "new"
    end
  end

  def edit
  end

  private

  def group_params
     params.require(:group).permit(:name)
  end
end
