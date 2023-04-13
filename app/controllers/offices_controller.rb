class OfficesController < ApplicationController
  before_action :set_company
  before_action :set_office, only: %i(show edit update update_users new_users)

  def index
    @offices = @company.offices.recent
    @pagy, @offices = pagy @offices, items: 10
  end

  def show
    @users = @office.users.recent
    @pagy, @users = pagy @users, items: 10
  end

  def new
    @office = @company.offices.build
    @office.office_infos.build
  end

  def edit; end

  def create
    @office = @company.offices.build office_params
    if @office.save
      redirect_to company_offices_path, notice: t(".success")
    else
      flash.now[:alert] = @office.errors.full_messages.to_sentence.capitalize
      render :new
    end
  end

  def update
    if @office.update office_params
      redirect_to company_offices_path, notice: t(".success")
    else
      flash.now[:alert] = @office.errors.full_messages.to_sentence.capitalize
      render :edit
    end
  end

  def new_users
    @users = User.without_office.recent
  end

  def update_users
    if User.by_ids(params[:user_ids]).update(office_id: @office.id)
      redirect_to company_office_path(company_id: @company.id, id: @office.id), notice: t(".success")
    else
      @users = User.without_office.recent
      flash.now[:alert] = t("shared.processing_failed")
      render :new_users
    end
  end

  private

  def set_company
    return if @company = Company.find_by(id: params[:company_id])

    redirect_to companies_path, alert: t("shared.company_does_not_exist")
  end

  def set_office
    return if @office = @company.offices.find_by(id: params[:id])

    redirect_to company_offices_path, alert: t("shared.office_does_not_exist")
  end

  def office_params
    params.require(:office).permit Office::ATTR_PARAMS
  end
end
