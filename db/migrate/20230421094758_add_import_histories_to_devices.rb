class AddImportHistoriesToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :import_history_id, :bigint

    add_reference :import_histories, :author, foreign_key: {to_table: :users}
  end
end
