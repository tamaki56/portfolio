class Public::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    if @user != current_user
      redirect_to user_path(current_user.id)
    end     
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      # タグの更新
      @recipe.save_tags(params[:recipe][:tags][:tag])
      # 成功したら投稿記事へリダイレクト
      redirect_to recipe_path(@recipe.id)
    else
      # 失敗した場合は、editへ戻る
      render :edit
    end    
  end

  def new
    @recipe = Recipe.new
    # @ingredient = @recipe.ingredients.build
    # @step = @recipe.steps.build
    # @mikan = @recipe.mikans.build
  end
  
  def create
    @recipe = Recipe.new(recipe_params) 
    if @recipe.save
      # タグの保存
      @recipe.save_tags(params[:recipe][:tags][:tag])
      flash[:success] = "投稿が完了しました！"
       # @recipe.saveでrecipeとingredient、step、mika同時に保存
      redirect_to recipe_path(current_user.id)
    else
      flash.now[:alert] = "投稿が失敗しました。"
      render :new
    end
  end
  
  def destroy
    Recipe.find(params[:id]).destroy()
    redirect_to recipes_path
  end  
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :description, :amount, :image, :genre, :tags,
    ingredients_attributes:[:id, :recipe_id, :content, :quantity, :_destroy],
    steps_attributes:[:id, :recipe_id, :images, :direction, :_destroy],
    recipe_mikans_attributes:[:id, :recipe_id, :mikan_id, :amount, :_destroy])
    .merge(user_id: current_user.id)
  end    
end
