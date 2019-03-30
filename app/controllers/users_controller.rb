class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, except: [:index,:show,:follows,:followers,:favorites,:message]

  def index
  	# app_controllerに記述(ヘッダーに検索機能を表示している為)
  end

  def show
  	@user =  User.find(params[:id])
  	@pictures = @user.pictures.order(created_at: "desc").page(params[:page]).per(200)
    @favorite_pictures = @user.favorite_pictures
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to edit_user_path, notice: "変更が保存されました!"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(200)
    @favorite_pictures = @user.favorite_pictures
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(200)
    @favorite_pictures = @user.favorite_pictures
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_pictures = @user.favorite_pictures.order("favorites.created_at desc").page(params[:page]).per(200)
  end

  def homes
    @user = User.find(params[:id])
    @users = @user.followings
    @pictures = []
          @users.each do |user|
            pictures = Picture.where(user_id: user.id).order(created_at: :desc)
            @pictures.concat(pictures)
          end
          current = Picture.where(user_id: current_user.id).order(created_at: :desc)
          @pictures.concat(current)
    @pictures = @pictures.sort_by{|picture| picture.created_at}.reverse
  end

  def message
    @user = User.find(params[:id])
    @users = @user.followings
    @favorite_pictures = @user.favorite_pictures
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduce, :avatar_image, :gender)
  end
  def screen_user
    unless params[:id].to_i == current_user.id
      redirect_to  homes_user_path(current_user)
    end
  end

end
