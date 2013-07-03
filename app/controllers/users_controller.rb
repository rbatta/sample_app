class UsersController < ApplicationController
  before_filter :signed_in_user,  only: [:edit, :update]
  before_filter :correct_user,    only: [:edit, :update]

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

  def edit
    # @user = User.find(params[:id]) removed because of the before_filter
    # that calls on and defines @user in correct_user
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
