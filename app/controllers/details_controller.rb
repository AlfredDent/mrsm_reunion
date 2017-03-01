class DetailsController < ApplicationController
  def show
    @details = Detail.all
  end

  def new

  end
  
  def create
    @detail = Detail.new(detail_params)
    
    if @detail.save
      flash[:notice] = 'Successfully submit form'
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

    def detail_params
      params.require(:detail).permit(:name, :email, :phone,
                                   :attend, :batch, :seat)
    end
  
end
