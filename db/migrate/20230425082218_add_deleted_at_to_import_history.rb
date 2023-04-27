class AddDeletedAtToImportHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :import_histories, :deleted_at, :datetime
    add_index :import_histories, :deleted_at
  end
end
