class PicturesController < ApplicationController

  def index
    @search = Picture.page(params[:page]).ransack(params[:q])
    @pictures = @search.result.order(created_at: "desc")
  end

  def new
    @picture = Picture.new
    @pictures = Picture.all #仮作成 / 投稿機能確認用
    @genre = Genre.new #仮作成 / ジャンル追加確認用
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    @picture.save
    redirect_to new_picture_path, notice: "新規投稿が正常に完了しました"
  end

  def show
    @picture = Picture.find(params[:id])
    @comment = Comment.new
    @comments = @picture.comments
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    redirect_to new_picture_path, notice: "投稿が削除されました"
  end

private
  def picture_params
    params.require(:picture).permit(:genre_id, :image, :title, :description)
  end

end
