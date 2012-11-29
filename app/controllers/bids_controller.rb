##
# This is the controller of the model of bid. All features and methods relates to bids is listed here.
#
#
class BidsController < ApplicationController
  # This method will create a bid
  # It requires the user to log in
  #
  # * *Handles* :
  #   - GET '/bids/:id'
  # * *Redirects* :
  #   - products#show -> if the user has signed in already
  # * *Redirects* :
  #   - root_url(home) -> if the user has not signed in yet
  #
  def create
     if signed_in?
        @bid = Bid.new(params[:bid])
        @product = Product.find_by_id(params[:id])

        if @bid.bidding_price <= @product.current_price
          flash[:notice] = "Invalid bid"
        else
          flash[:success] = "Successful bid"
          @bid.user_id = current_user.id
          @bid.product_id = @product.id
          @bid.save
          @product.current_price = @bid.bidding_price
          UserMailer.bid_success_confirmation(current_user, @product).deliver
          @product.save
        end

        redirect_to :controller => 'products', :action => 'show'
     else
       redirect_to root_url
     end
  end

  def show
  end

  def list
    @history = Bid.find(:all, :conditions => {:user_id => current_user.id})
  end

end
