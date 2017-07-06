class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.user_id == current_user.id
      user.update(user_params)
    end
  end

  private
  def user_params
    params.requiere(:users).permit(:name, :email)
  end

end
