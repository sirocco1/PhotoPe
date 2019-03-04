class PicturesController < ApplicationController

  def index
  end

  def new
    @picture = Picture.new
    @pictures = Picture.all #仮作成 / 投稿機能確認用
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    @picture.save
    redirect_to pictures_path
  end

  def show
  end

  def destroy
  end

private
  def picture_params
    params.require(:picture).permit(:animal_genre, :image, :video, :description)
  end

end
