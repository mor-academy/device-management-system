class OfficesController < ApplicationController
  before_action :set_company
  before_action :set_office, only: %i(show edit update add_users new_users)
  before_action :check_user_ids_present, only: :add_users

  def index
    @query = @company.offices.ransack params[:query]
    @pagy, @offices = pagy @query.result(distinct: true).includes(:office_info).recent,
                           items: Settings.pagy.config.page.default
  end

  def show
    @users = @office.users.recent
    @pagy, @users = pagy @users, items: Settings.pagy.config.page.default
  end

  def new
    @office = @company.offices.build
    @office.office_infos.build
  end

  def edit; end

  def create
    @office = @company.offices.build office_params
    if @office.save
      flash.now[:notice] = t ".success"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @office.update office_params
      flash.now[:notice] = t ".success"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new_users
    @users = User.without_office.recent
  end

  def add_users
    users_need_add = User.by_ids params[:user_ids]
    if users_need_add.update office_id: @office.id
      redirect_to company_office_path(company_id: @company.id, id: @office.id), notice: t(".success")
    else
      @users = User.without_office.recent
      flash.now[:alert] = t "shared.processing_failed"
      render :new_users
    end
  end

  private

  def office_params
    params.require(:office).permit Office::ATTR_PARAMS
  end

  def set_company
    return if @company = Company.find_by(id: params[:company_id])

    redirect_to companies_path, alert: t("shared.company_does_not_exist")
  end

  def set_office
    return if @office = @company.offices.find_by(id: params[:id])

    redirect_to company_offices_path, alert: t("shared.office_does_not_exist")
  end

  def check_user_ids_present
    return if params[:user_ids].present?

    flash[:notice] = t "shared.processing_failed"
    redirect_to new_users_company_office_path(company_id: @company.id, id: @office.id)
  end
end
