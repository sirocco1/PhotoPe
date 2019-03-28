class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]

  def index
  	@users = current_user.followings
  end

  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
      redirect_to "/rooms/#{@message.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
      @message = Message.find(params[:id])
    if @message.destroy
      redirect_to "/rooms/#{@message.room_id}"
    end
  end

end
