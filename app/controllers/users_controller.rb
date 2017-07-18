class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if current_user.update(user_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def search
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    render json: @users
  end

  private
  def user_params
    params.require(:users).permit(:name, :email)
  end

end
