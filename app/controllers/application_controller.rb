class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    locale = params[:locale]&.strip&.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
