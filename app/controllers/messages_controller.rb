class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.build(message_params.merge(user: current_user))

    if @message.save
      redirect_to room_path(@room)
    else
      flash[:alert] = "メッセージを送信できませんでした。"
      redirect_to room_path(@room)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end