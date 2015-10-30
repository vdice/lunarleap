class ChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  before_action :find_challenge, except: [:index, :new, :create]

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

  def destroy
    @challenge.destroy
    redirect_to user_challenges_path(@user)
  end

  private
  def find_user
    @user = User.find(params[:user_id])
    verify_current_user(@user)
  end

  def find_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:name, :description)
  end
end
