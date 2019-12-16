class ProfilesController < ApplicationController

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to profile_path, notice: 'ユーザーを更新しました'
    else
      flash.now[:notice] = 'ユーザー更新失敗'
      render :edit
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
