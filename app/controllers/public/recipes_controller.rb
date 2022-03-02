class Public::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
  end

  def new
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
    @step = @recipe.steps.build
    @mikan = @recipe.mikans.build
  end
  
  def create
    @recipe = Recipe.new(recipe_params) 
    if @recipe.save
      flash[:success] = "投稿が完了しました！"
       # @recipe.saveでrecipeとingredient、step、mika同時に保存
      redirect_to recipe_path(current_user.id)
    else
      flash.now[:alert] = "投稿が失敗しました。"
      render :new
    end
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :description, :image,
    ingredients_attributes:[:id, :recipe_id, :mikan_name, :content, :quantity, :amount, :_destroy],
    steps_attributes:[:id, :recipe_id, :number, :step_image, :direction, :_destroy],
    mikans_attributes:[:id, :recipe_id, :mikan_name, :amount, :mikan_image, :_destroy])
    .merge(user_id: current_user.id)
  end    
end
