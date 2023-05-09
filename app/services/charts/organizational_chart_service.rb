class Charts::OrganizationalChartService
  def initialize company: nil
    @company = company
  end

  def perform
    data_table
  end

  private

  attr_reader :company

  def data_table
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column :string, :name
    data_table.new_column :string, :parent
    data_rows = []
    company.offices.each do |office|
      data_rows << office_rows(office)
      office.users.each do |user|
        data_rows << user_rows(user)
      end
    end
    data_table.add_rows data_rows
    options = option_params
    GoogleVisualr::Interactive::OrgChart.new data_table, options
  end

  def option_params
    {
      allowHtml: true,
      allowCollapse: true,
      compactRows: true
    }
  end

  def office_rows office
    [
      {
        v: "office_id_#{office.id}",
        f: office.office_info.name
      },
      office.company.office_info.name
    ]
  end

  def user_rows user
    [
      {
        v: "user_id_#{user.id}",
        f: user.fullname
      },
      parent_identifier(user)
    ]
  end

  def parent_identifier user
    user.leader.present? ? "user_id_#{user.leader_id}" : "office_id_#{user.office_id}"
  end
end
