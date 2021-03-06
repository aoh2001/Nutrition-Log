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
			@ingredient.nutritions.create({:name => "Calories", :quantity => nutr["Calories"].to_f})
			@ingredient.nutritions.create({:name => "Protein", :quantity => nutr["Protein"].to_f})
			@ingredient.nutritions.create({:name => "Carbs", :quantity => nutr["Carbs"].to_f})
			@ingredient.nutritions.create({:name => "Fiber", :quantity => nutr["Fiber"].to_f})
			@ingredient.nutritions.create({:name => "Trans Fat", :quantity => nutr["Trans_Fat"].to_f})
			@ingredient.nutritions.create({:name => "Fat", :quantity => nutr["Fat"].to_f})
			@ingredient.nutritions.create({:name => "Vitamin B6", :quantity => nutr["Vitamin_B6"].to_f})
			@ingredient.nutritions.create({:name => "Vitamin B12", :quantity => nutr["Vitamin_B12"].to_f})
			@ingredient.nutritions.create({:name => "Vitamin C", :quantity => nutr["Vitamin_C"].to_f})
			@ingredient.nutritions.create({:name => "Vitamin D", :quantity => nutr["Vitamin_D"].to_f})
			@ingredient.nutritions.create({:name => "Calcium", :quantity => nutr["Calcium"].to_f})
			@ingredient.nutritions.create({:name => "Potassium", :quantity => nutr["Potassium"].to_f})
			@ingredient.nutritions.create({:name => "Sodium", :quantity => nutr["Sodium"].to_f})
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

	def search
		@a=Ingredient.search(params[:q])
		render :partial => "ingredients/ingredient_list", :locals => {:ingredient => @a, :rid => params[:rid]}
	end

end
