class SubscriptionsController < ApplicationController
  before_action :find_subscriber
  before_action :verify_subscriber
  before_action :find_subscription, except: [:index, :new, :create]

  def create
    @subscription = @subscriber.subscriptions.new(subscription_params)
    @subscription.save
    @user = User.find(subscription_params[:author_id])
    respond_to :js
  end

  def destroy
    @user = User.find(@subscription.author_id)
    @subscription.destroy
    respond_to :js
  end

  private
  def find_subscriber
    @subscriber = User.find(params[:user_id])
  end

  def verify_subscriber
    verify_current_user(@subscriber)
  end

  def find_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:author_id)
  end
end
