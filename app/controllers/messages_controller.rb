class MessagesController < ApplicationController
  def index
    @room  = Room.find(params[:room_id])
    @message = @room.messages.build
    @messages = @room.messages
  end

  def create
    @room = Room.find(params[:room_id])
    @room.messages.create message_params
    redirect_to room_messages_path(@room)
  end

  private

  def message_params
    params.require(:message).permit(:username, :content, :room_id)
  end
end
