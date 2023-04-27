class RequestsController < ApplicationController
  before_action :set_request, only: %i(show edit update)
  before_action :devices_by_office, only: %i(new create edit update)

  def index
    @query = current_user.requests.ransack params[:query]
    @pagy, @requests = pagy @query.result.recent, items: Settings.pagy.config.page.default
  end

  def show; end

  def new
    @request = current_user.requests.build
  end

  def edit; end

  def create
    @request = current_user.requests.build request_params
    if @request.save
      flash.now[:notice] = t ".success"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @request.update request_params
      flash.now[:notice] = t ".success"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def request_params
    params.require(:request).permit :type_request, :status, :reason, :information, :user_id, :device_id
  end

  def set_request
    return if @request = current_user.requests.find_by(id: params[:id])

    redirect_to requests_path, alert: t("shared.request_does_not_exist")
  end

  def devices_by_office
    @devices_by_office = current_user.office.devices.order(id: :asc)
  end
end
