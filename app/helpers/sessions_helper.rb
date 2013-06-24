module SessionsHelper

	def sign_in(user)
		# cookies.permanent[:remember_token] is same as
		# cookies[:remember_token] = { value: user.remember_token, 
		# 														 expires: 20.years.from_now.utc }
		# 
		# self.current_user = user lets us use <%= current_user.name %> 
		# or redirect_to current_user type things in controller/views
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	# not (current_user is nil?) = current_user is signed in.
	def signed_in?
		!current_user.nil?
	end

	# signing out
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	# this forces self.current_user = ... to be converted to current_user=(...)
	def current_user=(user)
		@current_user = user
	end

	# use short circuit eval to make sure current_user has a value
	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end
end
