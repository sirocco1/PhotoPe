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
    redirect_to new_picture_path, notice: "新規投稿が正常に完了しました"
  end

  def show
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    redirect_to new_picture_path, notice: "投稿が削除されました"
  end

private
  def picture_params
    params.require(:picture).permit(:animal_genre, :image, :video, :description)
  end

end
