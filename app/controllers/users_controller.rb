class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:name, :profile, :avatar))
      flash[:notice] = "プロフィールを更新しました"
      redirect_to '/users/profile'
    else
      render "edit"
    end
  end

  def show_account
    @user = current_user
  end
end
