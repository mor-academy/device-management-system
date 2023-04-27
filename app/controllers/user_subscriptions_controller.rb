class UserSubscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    current_user.user_subscriptions.by_endpoint(params[:endpoint]).first_or_create do |user_subscription|
      user_subscription.expiration_time = params[:expirationTime]
      user_subscription.keys = params[:keys]
    end
  end
end
