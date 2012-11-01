class StaticPagesController < ApplicationController

  def home
  	puts "#####################################"
  	puts watchlists_path
  	puts bids_path
    @products = Product.all   
  end

  def help
  end

  def about
  end

end