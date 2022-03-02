class Admin::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更されました"
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end      
  end
  
  def destroy
    @user = User.find(params[:id])  
    if @user.destroy
      redirect_to admin_users_path
    end
  end

  
  private
  
  def user_params
    params.require(:user).permit(:name, :nickname, :email)
  end    
end
