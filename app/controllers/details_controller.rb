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
      flash[:notice] = 'Please resubmit the form'
      redirect_to root_path
    end
  end

    def detail_params
      params.require(:detail).permit(:name, :email, :phone,
                                   :attend, :batch, :seat, :allergy, :note)
    end
  
end
