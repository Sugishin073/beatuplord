class BeatsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_beat, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

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

  def destroy
    @beat = Beat.find(params[:id])
    @beat.destroy
    redirect_to root_path, notice: "ビートを削除しました。"
  end

  def edit
    @beat = Beat.find(params[:id])
    unless @beat.user == current_user
      flash[:alert] = "編集する権限がありません。"
      redirect_to root_path # ここを適切なリダイレクト先に変更
    end
  end

  def update
    if @beat.update(beat_params)
      redirect_to beats_path, notice: "ビートを更新しました。"
    else
      render :edit
    end
  end

  private

  def set_beat
    @beat = Beat.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to beats_path, alert: "ビートが見つかりませんでした。"
  end

  def authorize_user!
    unless @beat.user == current_user
      flash[:alert] = "権限がありません。"
      redirect_to root_path
    end
  end

  def beat_params
    params.require(:beat).permit(:title, :genre_id, :vibes_id, :audio_file).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end