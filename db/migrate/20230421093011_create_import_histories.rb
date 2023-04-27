class CreateImportHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :import_histories do |t|
      t.string :file_name
      t.datetime :input_date
      
      t.timestamps
    end
  end
end
