class Public::MikansController < ApplicationController
  def index
    @mikans = Mikan.all
  end

  def show
    @mikan = Mikan.find(params[:id])
  end
  
  private
  
  def mikan_params
    params.require(:mikan).permit(:mikan_name, :introduction, :price, :sweetness, :season, :tip_title, :tip, :tip_image, images: [])
  end 
end
