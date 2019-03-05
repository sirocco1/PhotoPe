class FavoritesController < ApplicationController
  def create
  	favorite = current_user.favorites.build(picture_id: params[:picture_id])
    favorite.save
    redirect_to users_path
  end

  def destroy
  	favorite = Favorite.find_by(picture_id: params[:picture_id], user_id: current_user.id)
    favorite.destroy
    redirect_to users_path
  end
end
