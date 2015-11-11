class UpdatesController < ApplicationController
  before_action :find_challenge_and_user, except: [:show]
  before_action :find_update, except: [:index, :new, :create]

  def new
    @update = Update.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @update = @challenge.updates.new(update_params)
    if @update.save
      respond_to do |format|
        format.html { redirect_to user_challenge_path(@user, @challenge) }
        format.js
      end
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def find_challenge_and_user
    @challenge = Challenge.find(params[:challenge_id])
    @user = @challenge.user
    verify_current_user(@user)
  end

  def find_update
    @update = Update.find(params[:id])
  end

  def update_params
    params.require(:update).permit(:title, :body, :picture)
  end
end
