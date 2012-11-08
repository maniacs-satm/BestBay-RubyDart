##
# This is the controller of the model of watchlists. All features and methods relates to watchlists is listed here.
#
#
class WatchlistsController < ApplicationController
  # This method will add an product in watchlist
  # It requires the user to log in
  #
  # * *Handles* :
  #   - GET /watchlists/:id
  # * *Redirects* :
  #   - products#index
  #
  def create
    @product = Product.find(params[:id])
    puts Watchlist.find(:all, :conditions =>{:product_id => @product.id, :user_id => current_user.id}).size
    if Watchlist.find(:all, :conditions =>{:product_id => @product.id, :user_id => current_user.id}).size != 0
      flash[:notice] = "Product already in watchlist"
    else
      @watchlist = Watchlist.new user_id: current_user.id, product_id: @product.id
      @watchlist.save
      flash[:success] = "Add successfully"
    end
    redirect_to controller: 'products', action: 'index'
  end
 # This method will display all products in watchlist
  # It requires the user to log in
  #
  # * *Handles* :
  #   - GET /watchlists
  # * *Renders* :
  #   - watchlist
  #
  def index
  	@user = current_user
  	@products = @user.products()
 	render 'watchlist'
  end
# This method will delete a product from watchlist
  # It requires the user to log in
  #
  # * *Handles* :
  #   - DELETE /watchlists/delete/:id
  # * *Renders* :
  #   - watchlist after delete
  #
  def delete 
  	@user = current_user
  	@product = Product.find(params[:id])
  	@user.products.delete(@product)
  	@products = @user.products()
    render 'watchlist'	
  end
end