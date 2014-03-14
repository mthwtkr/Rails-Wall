class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	def show
		@user = User.find(params[:id])
		@message = Message.new
		@comment = Comment.new

		@users = User.all
		@messages = Message.all.order(created_at: :desc)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in(@user)
			redirect_to @user, notice: "User was successfully created."
		else
			render action: "new"
		end
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
end
