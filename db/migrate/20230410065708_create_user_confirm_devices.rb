class CreateUserConfirmDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :user_confirm_devices do |t|
      t.integer :admin_device_status
      t.integer :staff_device_status
      t.datetime :admin_confirm_at
      t.datetime :staff_comfirm_at
      t.integer :status

      t.timestamps
    end
  end
end
