class WatchlistsController < ApplicationController
  def create
    @product = Product.find(params[:id])
    if @product.users.include? (current_user)
      flash[:notice] = "Product already in watchlist"
    else
      @product.users << current_user
      flash[:success] = "Add successfully"
    end
    redirect_to controller: 'products', action: 'index'
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