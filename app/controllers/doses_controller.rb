class DosesController < ApplicationController
  # def new
  #   @dose = Dose.new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @ingredients = Ingredient.all
  # end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    # @dose.ingredient = Ingredient.find(params[:ingredient_id])
    # raise
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render "cocktails/show"
  # le render il fuat mettre le path en dur à partir du dossier views
    end
  end

  def destroy
     @dose = Dose.find(params[:id])
     @cocktail = Cocktail.find(@dose.cocktail_id)
     @dose.destroy
     redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
