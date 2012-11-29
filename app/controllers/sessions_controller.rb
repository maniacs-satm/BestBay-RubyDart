##
# This is the controller of the model of sessions. All features and methods relates to sessions is listed here.
#
#
class SessionsController < ApplicationController

  def new
  end
  # This method will create a session
  #
  # * *Handles* :
  #   - POST /sessions
  # * *Redirects* :
  #   - products#index -> if the signin info is valid
  # * *Renders* :
  #   - sessions_new -> if the signin info is invalid
  #
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user

      if user.admin
        redirect_to :controller => 'users', :action => 'index'
      else
        redirect_to :controller => 'products', :action => 'index'
      end
    else
      flash[:notice] = "Invalid Email/Password combination"
      render 'new'
    end
  end

  # This method will sign out
  #
  # * *Handles* :
  #   - DELETE /sessions/1
  # * *Redirects* :
  #   - root_url(home)
  #
  def destroy
    sign_out
    redirect_to root_url
  end
end
