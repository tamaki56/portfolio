class Admin::TagsController < ApplicationController

  def index
    @tags = Tag.all
  end
  
  def destroy
    @tag = Tag.find(params[:id])  
    if @tag.destroy
      redirect_to admin_tags_path
    end
  end
  
  def show
    @tag = Tag.find(params[:id])
  end
  
  def tag_params
    params.require(:tag).permit(:name)
  end    
end
