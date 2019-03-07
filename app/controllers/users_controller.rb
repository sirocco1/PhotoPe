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
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "successfully updated user!"
    else
      render "edit"
    end
  end

  def destroy
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
    @favorite_pictures = @user.favorite_pictures
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    @favorite_pictures = @user.favorite_pictures
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_pictures = @user.favorite_pictures
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduce, :avatar_image, :gender)
  end

end
