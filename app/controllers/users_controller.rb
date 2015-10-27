class UsersController < ApplicationController
	before_action :def_user, only:[:show, :edit, :destroy, :update]
	
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		#binding.pry
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else 
			flash[:alert] = @user.errors.full_messages
			render :new
		end
	end

	def update
		@user.update(user_params)
		redirect_to @user
	end

	def show
		
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :balance)
	end

	def def_user
		@user ||= User.find(params[:id])
	end
end
