class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# if correct sign in properly and redirect to user page
			sign_in user
			redirect_to user
		else
			# if incorrect, pop up error msg and re-render signin form
			# flash persists over other pages
			# flash.now renders only on current page (once)
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
	
end
