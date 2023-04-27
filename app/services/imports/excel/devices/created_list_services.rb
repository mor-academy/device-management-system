class Imports::Excel::Devices::CreatedListServices
  def initialize file: nil, user: nil
    @file = file
    @user = user
    initial_data
  end

  def perform
    create_new_devices
    import_history
  end

  private

  attr_reader :file, :user, :import_history, :excel_data, :device_data, :brand_not_exist, :categories_not_exist,
              :group_brands, :group_categories

  def initial_data
    @excel_data = build_data_from_excel
    @categories_not_exist = build_categories_not_exist
    @brand_not_exist = build_brand_not_exist
  end

  def build_data_from_excel
    xlsx = Roo::Spreadsheet.open file
    result = []
    xlsx.sheet(0).each_with_index(sheet_index_value) do |val, index|
      result.push(val) unless index.zero?
    end
    result
  end

  def sheet_index_value
    {
      name: I18n.t("devices.index.name"),
      description: I18n.t("devices.index.description"),
      source: I18n.t("devices.index.source"),
      brand_id: I18n.t("devices.index.brand"),
      category_id: I18n.t("devices.index.category"),
      input_date: I18n.t("devices.index.input_date"),
      price: I18n.t("devices.index.price")
    }
  end

  def build_brand_not_exist
    brands_form_excel = excel_data.pluck(:brand_id).compact_blank
    brands_form_database = Brand.by_name(brands_form_excel).pluck :name
    brands_form_excel - brands_form_database
  end

  def build_categories_not_exist
    categories_from_excel = excel_data.pluck(:category_id).compact_blank
    categories_from_database = Category.by_name(categories_from_excel).pluck :name
    categories_from_excel - categories_from_database
  end

  def company_name
    @user.office.company.office_info&.email&.split("@")&.first
  end

  def device_params
    excel_data.map do |device|
      device[:brand_id] = get_value_brand device
      device[:category_id] = get_value_category device
      device[:status] = :draft
      device[:code] = company_name
      device[:import_history_id] = import_history.id
      device
    end
  end

  def get_value_brand device
    group_brands[device[:brand_id]].first.id
  end

  def get_value_category device
    group_categories[device[:category_id]].first.id
  end

  def create_new_devices
    ActiveRecord::Base.transaction do
      @import_history = user.import_histories.create file_name: file.original_filename, input_date: DateTime.now
      categories_not_exist.each{|category_name| Category.create(name: category_name)}
      brand_not_exist.each{|brand_name| Brand.create(name: brand_name)}
      load_data_after_insert
      @device_data = user.office.devices.insert_all device_params
    end
  end

  def load_data_after_insert
    @group_brands = Brand.by_name(excel_data.pluck(:brand_id).compact_blank).group_by(&:name)
    @group_categories = Category.by_name(excel_data.pluck(:category_id).compact_blank).group_by(&:name)
  end
end
