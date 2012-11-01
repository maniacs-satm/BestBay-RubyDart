class WatchlistsController < ApplicationController
  def create
    @product = Product.find(params[:id])

    @product.users << current_user unless @product.users.include?(current_user)

    redirect_to root_url
  end

  def index
  	@user = current_user
  	@products = @user.products()
 	render 'watchlist'
  end

  def delete
  	@user = current_user
  	@product = Product.find(params[:id])
  	@user.products.delete(@product)
  	@products = @user.products()
    render 'watchlist'	
  end
end