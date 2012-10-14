class SessionsController < ApplicationController
<<<<<<< HEAD
  def new
=======

  def new

>>>>>>> 43a627f0ddc186b3c6c0ad4ac2396223991f307e
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
<<<<<<< HEAD
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

=======

    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:notice] = "Congratulation! You are successfully registered."
      redirect_to :controller => 'welcome', :action => 'index'
    else
      flash[:notice] = "Invalid Email/Password combination"
      redirect_to :controller => 'welcome', :action => 'index'
    end
  end

>>>>>>> 43a627f0ddc186b3c6c0ad4ac2396223991f307e
  def destroy
    sign_out
    redirect_to root_url
  end
<<<<<<< HEAD
=======

>>>>>>> 43a627f0ddc186b3c6c0ad4ac2396223991f307e
end
