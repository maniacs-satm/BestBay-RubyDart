##
# This is the controller that define users
#

class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
# This method will new a user
  #
  # * *Handles* :
  #   - GET /users/new
  #
  def new
    @user = User.new
  end
# This method will create a user
  #
  # * *Handles* :
  #   - POST /sessions
  # * *Redirects* :
  #   - users#show -> if user save sign up successfully
  # * *Renders* :
  #   - user_new -> if the signin info is invalid
  #
  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      sign_in @user
      flash[:success] = 'Welcome to BestBay!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show

  end
# This method will delete a user
  #
  # * *Handles* :
  #   - DELETE /users/1
  # * *Redirects* :
  #   - root_path(home)
  #
  def destroy
    redirect_to root_path
  end

  def edit
  end
# This method will update a user
  #
  # * *Handles* :
  #   - PUT /users/1
  # * *Redirects* :
  #   - users/show
  # * *Renders* :
  #   - users#edit -> if the signin info is invalid
  #
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
# This method will check whether a user is signed in
  #
  # * *Redirects* :
  #   - signin_url -> if not signed in
  #
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
# This method will check whether a user is the correct user
  #
  # * *Redirects* :
  #   - root_path(home) -> if not the correct user
  #
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
