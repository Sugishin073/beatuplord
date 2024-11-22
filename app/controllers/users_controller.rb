class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @beats = @user.beats
  end

  def edit
    @user = current_user # 現在ログインしているユーザーを取得
  end

  def update
    @user = current_user # 現在ログインしているユーザーを取得
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールが更新されました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :avatar) # avatarパラメータを許可
  end
end
