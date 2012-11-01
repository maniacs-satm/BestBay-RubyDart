class StaticPagesController < ApplicationController

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
