class GenresController < ApplicationController

	def create
		@genre = Genre.new(genre_params)
		@genre.save
		redirect_to new_picture_path, notice: "ジャンル追加！"
	end

  private
  	def genre_params
    params.require(:genre).permit(:name)
  	end
end
