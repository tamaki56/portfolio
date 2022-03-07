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
    if params[:mikan][:image_ids]
      params[:mikan][:image_ids].each do |image_id|
        image = @mikan.images.find(image_id)
        image.purge
      end
    end
    if @mikan.update(mikan_params)
      flash[:success] = "編集しました"
      redirect_to admin_mikan_path(@mikan.id)
    else
      render :edit
    end
  end

  def destroy
    @mikan = Mikan.find(params[:id])  
    if @mikan.destroy
      redirect_to admin_mikans_path
    end    
  end


  private
  
  def mikan_params
    params.require(:mikan).permit(:mikan_name, :introduction, :price, :sweetness, :season, :tip_title, :tip, :image, images: [])
  end  
end
