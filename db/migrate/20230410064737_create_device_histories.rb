class CreateDeviceHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :device_histories do |t|
      t.datetime :input_date
      t.datetime :output_date
      
      t.timestamps
    end
  end
end
