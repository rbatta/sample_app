class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      # once you create a new user, automatically signs them in
      sign_in @user
  	  # handle successful save
  	  flash[:success] = "Welcome to the Sample App!"
  	  redirect_to @user
  	else
  	  render 'new'
  	end
  end

  def destroy
  end
end
