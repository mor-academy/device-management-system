class CompaniesController < ApplicationController
  before_action :set_company, only: %i(show edit update)

  def index
    @companies = Company.recent
    @pagy, @companies = pagy @companies, items: Settings.pagy.config.page.default
  end

  def show; end

  def new
    @company = Company.new
    @company.office_infos.build
  end

  def edit; end

  def create
    @company = Company.new company_params
    if @company.save
      redirect_to companies_path, notice: t(".success")
    else
      flash.now[:alert] = @company.errors.full_messages.to_sentence.capitalize
      render :new
    end
  end

  def update
    if @company.update company_params
      redirect_to companies_path, notice: t(".success")
    else
      flash.now[:alert] = @company.errors.full_messages.to_sentence.capitalize
      render :edit
    end
  end

  private

  def set_company
    return if @company = Company.find_by(id: params[:id])

    redirect_to companies_path, alert: t("shared.company_does_not_exist")
  end

  def company_params
    params.require(:company).permit Company::ATTR_PARAMS
  end
end
