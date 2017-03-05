class ImagesController < ApplicationController
  
  def show
    @image = Image.find_by_id(params[:id])
  end
  
  def new
    @image = Image.new
  end
  
  def create
    @image = Image.create(params_image)
    redirect_to image_new_path
  end
  
  private
  
  def params_image
    params.require(:image).permit(:name)
  end

end
