class CreateOfficeInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :office_infos do |t|
      t.string :name, null: false
      t.text :information, null: false
      t.text :address, null: false
      t.text :email, null: false
      t.bigint :info_id, null: false
      t.string :info_type, null: false
    
      t.timestamps
    end
  end
end
