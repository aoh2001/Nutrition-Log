class UsersController < ApplicationController
	include UserHelper

  before_filter :redirect_if_not_signed_in, :only => [:profile, :edit, :update, :destroy]

	def new
		@title = "Sign Up"
		@user = User.new
  end
     def show
		@user = User.find(params[:id])
		@title = @user.name
		
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
          end
    end	
    
  def update
		if current_user.update_attributes(user_params)
			redirect_to profile_path
		else
			flash.now[:error] = "Fix the errors before updating"
			@title = "Edit Profile"
			@user = current_user
			render 'edit'
		end
  end

	def profile
			@title = current_user.name
			@user = current_user
			@count = Ingredient.count
			@recentusers = Ingredient.recently_added.group("creator_id")
	end

  def create
		@user = User.create(user_params)
		if @user.save
			sign_in @user
			redirect_to @user
		else
			flash.now[:error] = "Fix the errors before clicking Sign Up"
			@title = "Sign Up"
			render 'new'
		end
  end

  def edit
  	@title = "Edit Profile"
		@user = current_user
		puts @user
	end

  def destroy
		user = current_user
		sign_out
	  user.delete
		redirect_to root_path
  end

  def index
  end

  def remove_log_item
		lr = LogRecipe.find(params[:lrid])
		unless lr.user_id = current_user.id
			redirect_to root_path
		end
		lr.logs.each {|l| l.delete}
		lr.delete
		redirect_to profile_path
	end


end
