class WatchlistsController < ApplicationController
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