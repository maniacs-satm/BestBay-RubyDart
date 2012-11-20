##
# This is the controller for review model. All features and methods relates to reviews are listed here.
#
#
class ReviewsController < ApplicationController
  def new
  end
  # This method will create a review
  # It requires the user to log in
  #
  # * *Handles* :
  #   - POST '/reviews/:id'
  # * *Redirects* :
  #   - products#show -> if the user has signed in already
  # * *Redirects* :
  #   - root_url(home) -> if the user has not signed in yet
  #
  
  def create
     if signed_in?
       @review = Review.new(params[:review])
       @id = params[:id]
       @review.product_id = @id
       @review.user_id = current_user.id
       @review.save

       flash[:success] = "Successful post review"

       redirect_to :controller => 'products', :action => 'show', :id => @id
     else
       redirect_to root_url
     end
  end

  def show
  end
end
