class ChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, except: [:index]
  before_action :verify_user, except: [:index, :show]
  before_action :find_challenge, except: [:index, :new, :create]

  def index
    @users = User.all
    if params[:user_id]
      find_user
    end
  end

  def new
    @challenge = Challenge.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @challenge = @user.challenges.new(challenge_params)
    if @challenge.save
      respond_to do |format|
        format.html { redirect_to user_challenges_path(@user) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @challenge.update(challenge_params)
      respond_to do |format|
        format.html { redirect_to user_challenges_path(@user) }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @challenge.destroy
    redirect_to user_challenges_path(@user)
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end

  def verify_user
    verify_current_user(@user)
  end

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:name, :description, :category_ids => [])
  end
end
