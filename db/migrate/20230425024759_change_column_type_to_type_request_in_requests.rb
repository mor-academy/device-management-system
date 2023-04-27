class ChangeColumnTypeToTypeRequestInRequests < ActiveRecord::Migration[7.0]
  def change
    rename_column :requests, :type, :type_request
  end
end
