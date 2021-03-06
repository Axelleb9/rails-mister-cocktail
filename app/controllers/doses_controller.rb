class DosesController < ApplicationController
  before_action :set_cocktail, only: [:show, :new, :create]
  before_action :set_dose, only: [:show, :destroy]
   

  def show
  end

  def new
  	@dose = Dose.new
  end

  def create
  	@dose = Dose.new(doses_params)
  	@dose.cocktail = @cocktail
  	if @dose.save
  		redirect_to cocktail_path(@cocktail)
  	else
  		render 'new'
  	end
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def doses_params
  	params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
  	@dose = Dose.find(params[:id])
  end

  def set_cocktail
  	@cocktail = Cocktail.find(params[:cocktail_id])
  end
end
