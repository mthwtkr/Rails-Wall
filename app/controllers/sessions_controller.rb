class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user == false || user.nil?
			redirect_to login_url,
			flash: {alert: 'No user exists with that email!'}
		else
			user = user.try(:authenticate, params[:session][:password])
			if user == false || user.nil?
				redirect_to login_url,
				flash: {alert: 'Incorrect Password!'}
			else
				sign_in user
				redirect_to user_url(user)
			end
		end
	end

	def destroy
		sign_out
		redirect_to register_url
	end
end
