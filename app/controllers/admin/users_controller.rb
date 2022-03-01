class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @user = User.find(params[:id])  
    @user.destroy  
    if @user.destroy
      redirect_to admin_users_path
    end
  end

  
  private
  
  def user_params
    params.require(:user).permit(:name, :nickname, :email)
  end    
end
