class SendNotificationService
  def initialize messages, user
    @messages = messages
    @user = user
  end

  def perform
    send_notification
  end

  private

  attr_reader :messages, :user

  def send_notification
    user.user_subscriptions.enable.each do |user_subscription|
      Webpush.payload_send(**user_subscriptions_params(user_subscription))
    rescue StandardError
      user_subscription.disable!
    end
  end

  def user_subscriptions_params user_subscription
    {
      endpoint: user_subscription.endpoint,
      message: messages.to_json,
      p256dh: user_subscription.keys["p256dh"],
      auth: user_subscription.keys["auth"],
      vapid: {
        public_key: ENV.fetch("VAPID_PUBLIC_KEY", nil),
        private_key: ENV.fetch("VAPID_PRIVATE_KEY", nil)
      }
    }
  end
end
