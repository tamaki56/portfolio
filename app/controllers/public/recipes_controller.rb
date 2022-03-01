class Public::RecipesController < ApplicationController
  def index
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
  end

  def new
  end
  
  def recipe_params
    params.require(:recipe).permit(:title, :description, :image)
  end    
end
