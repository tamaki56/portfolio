class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @recipes = @user.recipes
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end 
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更されました"
      redirect_to my_page_path(current_user.id)
    else
      render :edit
    end  
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :nickname, :email)
  end  
end
