class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to BestBay!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show

  end

  def destroy
    redirect_to root_path
  end
end
