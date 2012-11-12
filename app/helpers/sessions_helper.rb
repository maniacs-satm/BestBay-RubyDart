# This module defines methods for session create and delete.
#

module SessionsHelper

  # This method will sign in user and add remember_token to user cookie.
  #
  # *param* - user
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  # This method will check if current_user is signed in or not
  #
  def signed_in?
    !current_user.nil?
  end

  # This method will set current_user
  #
  # *param* - user
  def current_user=(user)
   @current_user = user
  end

  # This method will check if an user is current_user.
  #
  # *param* - user
  def current_user?(user)
    user == current_user
  end

  # This method will return current_user.
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  # This method will sign out current_user.
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
