class IngredientsController < ApplicationController
	include IngredientHelper

	before_filter :redirect_if_not_signed_in, :only => [:new, :create]

  def index
		@recently_add_ingredients = Ingredient.recently_added
		@title = "Ingredients"
		@recipes = Recipe.search(params[:search])
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
		
		    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ingredient }
          end
  end

  def new
		@title = "New Ingredient"
		@ingredient = Ingredient.new
  end

  def create
		@ingredient = Ingredient.create(ingredient_params)
		nutr = params[:nutr]
		if @ingredient.save
			@ingredient.nutritions.create({:name => "Calories", :quantity => nutr["Calories"]})
			@ingredient.nutritions.create({:name => "Protein", :quantity => nutr["Protein"]})
			@ingredient.nutritions.create({:name => "Carbs", :quantity => nutr["Carbs"]})
			@ingredient.nutritions.create({:name => "Fiber", :quantity => nutr["Fiber"]})
			@ingredient.nutritions.create({:name => "Trans Fat", :quantity => nutr["Trans_Fat"]})
			@ingredient.nutritions.create({:name => "Fat", :quantity => nutr["Fat"]})
			@ingredient.nutritions.create({:name => "Vitamin B6", :quantity => nutr["Vitamin_B6"]})
			@ingredient.nutritions.create({:name => "Vitamin B12", :quantity => nutr["Vitamin_B12"]})
			@ingredient.nutritions.create({:name => "Vitamin C", :quantity => nutr["Vitamin_C"]})
			@ingredient.nutritions.create({:name => "Vitamin D", :quantity => nutr["Vitamin_D"]})
			@ingredient.nutritions.create({:name => "Calcium", :quantity => nutr["Calcium"]})
			@ingredient.nutritions.create({:name => "Potassium", :quantity => nutr["Potassium"]})
			@ingredient.nutritions.create({:name => "Sodium", :quantity => nutr["Sodium"].to_i:q})
			redirect_to ingredient_path @ingredient
		else
			flash.now[:error] = "Fix the errors before saving the ingredient"
			render 'new'
		end
  end

  
    def destroy
		
	  Ingredient.find(params[:id]).delete
		redirect_to ingredients_path
  end


end
