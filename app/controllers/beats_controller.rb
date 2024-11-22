class BeatsController < ApplicationController
  def index
    @beats = Beat.all
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
    params.require(:beat).permit(:title, :genre_id, :vibes_id, :audio_file)
  end
end