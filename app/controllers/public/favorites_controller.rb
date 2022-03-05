class Public::FavoritesController < ApplicationController
  
  before_action :set_recipe
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ  
  # お気に入り登録
  def create
    @recipe = Recipe.find(params[:recipe_id])
    if @recipe.user_id != current_user.id   # 自分の投稿以外にお気に入り登録が可能
      @favorite = Favorite.create(user_id: current_user.id, recipe_id: @recipe.id)
    end    
  end
  # お気に入り削除
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.find_by(recipe_id: recipe.id)
    @favorite.destroy
    redirect_to recipe_path(@recipe.id)
  end
end
