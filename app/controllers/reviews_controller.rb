##
# This is the controller for review model. All features and methods relates to reviews are listed here.
#
#
class ReviewsController < ApplicationController
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
  def new
  end
  
  def create
     if signed_in?
       @review = Review.new(params[:review])
       @id = params[:id]
       @review.product_id = @id
       @review.from_user_id = current_user.id
       @review.to_user_id = 1

       flash[:success] = "Successful post review"
       @review.save

       redirect_to :controller => 'products', :action => 'show', :id => @id
     else
       redirect_to root_url
     end
  end

  def show
  end
end
