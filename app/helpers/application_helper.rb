module ApplicationHelper
  def is_active_navigation? controller
    controller_name&.to_sym == controller
  end
end
