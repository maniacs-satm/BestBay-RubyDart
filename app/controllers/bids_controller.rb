class BidsController < ApplicationController

  def create
     if signed_in?
        @bid = Bid.new(params[:bid])
        @product = Product.find_by_id(params[:id])

        if @bid.bidding_price <= @product.current_price
          flash[:notice] = "Invalid bid"
        else
          flash[:success] = "Successful bid"
          @product.current_price = @bid.bidding_price
          @product.save
        end
        redirect_to :controller => 'products', :action => 'show'
     else
       redirect_to root_url
     end
  end

  def show

  end

end
