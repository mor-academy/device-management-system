class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_locale
  before_action :authenticate_user!
  layout :app_layout

  private

  def set_locale
    locale = params[:locale]&.strip&.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def app_layout
    devise_controller? ? "with_out_login" : "application"
  end
end
