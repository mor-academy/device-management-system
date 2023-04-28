class AddInputDateInDevice < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :input_date, :date
  end
end
