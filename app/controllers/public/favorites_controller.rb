class Public::FavoritesController < ApplicationController
  
  # お気に入り登録
  def create
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.new(recipe_id: recipe.id)
    favorite.save
    redirect_to recipe_path(recipe.id)
  end
  # お気に入り削除
  def destroy
    recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe_id: recipe.id)
    favorite.destroy
    redirect_to recipe_path(recipe.id)
  end
end
