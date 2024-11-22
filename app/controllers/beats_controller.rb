class BeatsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @beats = Beat.includes(:user)
  end

  def new
    @beat = Beat.new
  end

  def create
    @beat = Beat.new(beat_params)

    if @beat.save
      redirect_to beats_path, notice: "ビートがアップロードされました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def beat_params
    params.require(:beat).permit(:title, :genre_id, :vibes_id, :audio_file).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end