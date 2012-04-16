class IngredientsController < ApplicationController
	include IngredientHelper

	before_filter :redirect_if_not_signed_in, :only => [:new, :create]

  def index
		@recently_add_ingredients = Ingredient.recently_added
		@title = "Ingredients"
		if signed_in?
			@created_ingredients = current_user.ingredients
			@consumed_ingredients = current_user.recently_consumed_ingredients
			render "index_user"
		else	
			render "index_public"
		end
  end

  def show
		@ingredient = Ingredient.find(params[:id])
		@title = @ingredient.name
  end

  def new
		@title = "New Ingredient"
		@ingredient = Ingredient.new
  end

  def create
		@ingredient = Ingredient.create(ingredient_params)
		if @ingredient.save
			redirect_to ingredient_path @ingredient
		else
			flash.now[:error] = "Fix the errors before saving the ingredient"
			render 'new'
		end
  end

end