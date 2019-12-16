class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update destroy]
  skip_before_action :login_required, only: %i[new create show]
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to new_user_path, notice: 'ユーザーを更新しました'
    else
      flash.now[:notice] = 'ユーザー更新失敗'
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: 'ユーザー登録しました'
    else
      flash.now[:notice] = 'ユーザー登録失敗'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    redirect_to new_user_path, notice: '不正なアクセスです' unless current_user.id.to_s == params[:id]
  end
end
