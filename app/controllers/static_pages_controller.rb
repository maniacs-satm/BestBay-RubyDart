##
# This is the StaticPages controller that define three methods-home, help and about
#
class StaticPagesController < ApplicationController
# This methods will display the homepage view
# *Renders*
#   - redirect to product list page -> if user has signed in already
#   - redirect to home page -> if user has not singed in
#
  def home   
	if signed_in?
		redirect_to controller: 'products', action: 'index'
	else
		render 'home'
	end
  end

  def help
  end

  def about
  end

end

