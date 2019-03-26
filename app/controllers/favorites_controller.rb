class FavoritesController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    favorite = current_user.favorites.build(picture_id: params[:picture_id])
    favorite.save
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    favorite = Favorite.find_by(picture_id: params[:picture_id], user_id: current_user.id)
    favorite.destroy
  end

end
