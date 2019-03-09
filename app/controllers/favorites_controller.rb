class FavoritesController < ApplicationController
  # def create
  #   @favorite = Favorite.create(user_id: current_user.id, picture_id: params[:picture_id])
  #   @favorites = Favorite.where(picture_id: params[:picture_id])
  #   @pictures = Picture.all
  # end

  # def destroy
  #   favorite = Favorite.find_by(user_id: current_user.id, picture_id: params[:picture_id])
  #   favorite.destroy
  #   @favorites = Favorite.where(picture_id: params[:picture_id])
  #   @pictures = Picture.all
  # end

  def create
    @picture = Picture.find(params[:picture_id])
    favorite = current_user.favorites.build(picture_id: params[:picture_id])
    favorite.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @picture = Picture.find(params[:picture_id])
    favorite = Favorite.find_by(picture_id: params[:picture_id], user_id: current_user.id)
    favorite.destroy
    # redirect_back(fallback_location: root_path)
  end

end
