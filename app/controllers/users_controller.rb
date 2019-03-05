class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@pictures = @user.pictures
    @favorite_pictures = @user.favorite_pictures
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

end
