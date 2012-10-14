module SessionsHelper
<<<<<<< HEAD
 def sign_in(user)
=======
  
  def sign_in(user)
>>>>>>> 43a627f0ddc186b3c6c0ad4ac2396223991f307e
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

<<<<<<< HEAD
  def signed_in?
    !current_user.nil?
  end
=======
>>>>>>> 43a627f0ddc186b3c6c0ad4ac2396223991f307e
  def current_user=(user)
    @current_user = user
  end

<<<<<<< HEAD
  def current_user?(user)
    user == current_user
  end
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
=======
  def current_user
    @current_user || User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
    !current_user.nil?
  end

>>>>>>> 43a627f0ddc186b3c6c0ad4ac2396223991f307e
end
