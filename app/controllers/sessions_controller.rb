class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:notice] = "Congratulation! You are successfully registered."
      redirect_to :controller => 'welcome', :action => 'index'
    else
      flash[:notice] = "Invalid Email/Password combination"
      redirect_to :controller => 'welcome', :action => 'index'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
