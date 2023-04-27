class Request < ApplicationRecord
  acts_as_paranoid

  belongs_to :device
  belongs_to :user

  has_rich_text :information
  has_rich_text :reason

  after_save :show_push_notification

  validates :type_request, uniqueness: {scope: [:device_id]}

  enum type_request: {repair: 0, replace: 1, buy: 2, supply: 3, remove: 4}
  enum status: {forwarded: 0, pending: 1, approved: 2, reject: 3, cancel: 4}, _default: :pending, _prefix: true

  broadcasts_to ->(request){[request.user, :requests]}, inserts_by: :prepend

  class << self
    def ransackable_attributes _auth_object = nil
      %w(id status type_request)
    end

    def ransackable_associations _auth_object = nil
      %w(device)
    end
  end

  private

  def show_push_notification
    type_request_translate = Request.human_enum_name(:type_request, type_request).downcase
    notification_params = {
      title: I18n.t("requests.model.subject"),
      message: I18n.t("requests.model.content", type_request: type_request_translate, device_name: device.name),
      href: Rails.application.routes.url_helpers.request_path(id:)
    }
    SendNotificationService.new(notification_params, user).perform
  end
end
