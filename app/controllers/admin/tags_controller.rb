class Admin::TagsController < ApplicationController
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    redirect_to admin_tags_path   
  end

  def index
    @tags = Tag.all
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to admin_tags_path  
  end
  
  def destroy
    @tag = Tag.find(params[:id])  
    if @tag.destroy
      redirect_to admin_tags_path
    end
  end
  
  def tag_params
    params.require(:tag).permit(:name)
  end    
end
