class Admin::RecipesController < ApplicationController
  def edit
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user    
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      # タグの更新
      @recipe.save_tags(params[:recipe][:tags][:tag])
      # 成功したら投稿記事へリダイレクト
      redirect_to admin_recipe_path(@recipe.id)
    else
      # 失敗した場合は、editへ戻る
      render :edit
    end    
  end
  
  def destroy
    Recipe.find(params[:id]).destroy()
    redirect_to admin_recipes_path
  end    

  def index
    @recipes = Recipe.all
    @posts = @recipes.page(params[:page]).per(20) #ページネーション
    
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :description, :amount, :image, :genre, :tags,
    ingredients_attributes:[:id, :recipe_id, :content, :quantity, :_destroy],
    steps_attributes:[:id, :recipe_id, :images, :direction, :_destroy],
    recipe_mikans_attributes:[:id, :recipe_id, :mikan_id, :amount, :_destroy])
    
  end   
end
