class CreateUserDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :user_devices do |t|
      t.integer :status, null: false, default: 0
      t.datetime :input_date
      t.datetime :output_date
      
      t.timestamps
    end
  end
end
