module ApplicationHelper
  include Pagy::Frontend

  def is_active_navigation? controller
    controller_name&.to_sym == controller
  end

  def convert_date_ymd date
    date&.strftime "%Y-%m-%d"
  end

  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end
end
