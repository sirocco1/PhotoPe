class PicturesController < ApplicationController
  before_action :authenticate_user!

  def index
    @search = Picture.page(params[:page]).ransack(params[:q])
    @pictures = @search.result.order(created_at: "desc")
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if @picture.save
      redirect_to homes_user_path(current_user), notice: "新規投稿が正常に完了しました。"
    else
      redirect_to homes_user_path(current_user), notice: "入力エラーが発生しています。投稿は失敗しました。"
    end
  end

  def show
    @picture = Picture.find(params[:id])
    @favorites = @picture.favorites
    @comment = Comment.new
    @comments = @picture.comments
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    redirect_to homes_user_path(current_user), notice: "投稿が削除されました。"
  end

private
  def picture_params
    params.require(:picture).permit(:genre_id, :image, :description)
  end

end
