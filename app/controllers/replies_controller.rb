##
# This is the controller for reply model. All features and methods relates to replies are listed here.
#
#
class RepliesController < ApplicationController
  
  def new
  end
  # This method will create a reply
  # It requires the user to log in
  #
  # * *Handles* :
  #   - GET '/replies/:id'
  # * *Redirects* :
  #   - products#show -> if the user has signed in already
  # * *Redirects* :
  #   - root_url(home) -> if the user has not signed in yet
  #
  def create
     if signed_in?
       @reply = Reply.new(params[:reply])
       @reply.user_id = current_user.id
       @reply.review_id = params[:id]
       
       @id = Review.find(:first, :conditions => {:id => @reply.review_id}).product_id

       flash[:success] = "Successful post reply"
       @reply.save

       redirect_to :controller => 'products', :action => 'show', :id => @id
     else
       redirect_to root_url
     end
  end

  def show
  end
end
