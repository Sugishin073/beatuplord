class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    target_user = User.find(params[:user_id])
    room = Room.between(current_user, target_user) || Room.create(user1: current_user, user2: target_user)
    redirect_to room_path(room)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.order(:created_at)
  end
end