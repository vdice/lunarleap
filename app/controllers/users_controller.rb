class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, except: [:new, :create, :index]

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def find_user
    @user = User.find(params[:id])
    verify_current_user(@user)
  end

  def user_params
    params.require(:user).permit(:username, :avatar)
  end
end
