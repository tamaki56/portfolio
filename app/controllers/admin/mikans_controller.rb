class Admin::MikansController < ApplicationController
  def new
    @mikan = Mikan.new
  end
  
  def create
    @mikan = Mikan.new(mikan_params)
    @mikan.save
    redirect_to admin_mikans_path    
  end
  
  def show
    @mikan = Mikan.find(params[:id])
  end

  def index
    @mikans = Mikan.all
  end
  
  def edit
    @mikan = Mikan.find(params[:id])
  end
  
  def update
    @mikan = Mikan.find(params[:id])
    @mikan.update(mikan_params)
    redirect_to admin_mikan_path(@mikan.id)
  end
  
  def destroy
    @mikan = Mikan.find(params[:id])  
    @mikan.destroy  
    if @mikan.destroy
      redirect_to admin_mikans_path
    end    
  end


  private
  
  def mikan_params
    params.require(:mikan).permit(:mikan_name, :mikan_image, :mikan_sub_image, :introduction, :price, :sweetness, :season, :tip_title, :tip, :tip_image)
  end  
end
