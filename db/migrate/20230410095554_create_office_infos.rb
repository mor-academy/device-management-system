class CreateOfficeInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :office_infos do |t|
      t.string :name, null: false
      t.text :information
      t.text :address
      t.text :email
      t.string :phone_number
      t.bigint :info_id, null: false
      t.string :info_type, null: false

      t.timestamps
    end
  end
end
