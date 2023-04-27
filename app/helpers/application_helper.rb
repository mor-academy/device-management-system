module ApplicationHelper
  include Pagy::Frontend

  def is_active_navigation? controller
    controller_name&.to_sym == controller
  end

  def convert_date_ymd date
    date&.strftime "%Y-%m-%d"
  end

  def render_turbo_stream_flash_messages
    turbo_stream.append :flash, partial: "layouts/flash"
  end

  def render_turbo_stream_close_modal
    turbo_stream.prepend :global_modal, partial: "layouts/modals/close_modal"
  end

  def avatar_url user
    return user.avatar if user&.avatar.present?

    "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
  end
end
