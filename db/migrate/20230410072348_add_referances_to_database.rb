class AddReferancesToDatabase < ActiveRecord::Migration[7.0]
  def change
    add_reference :devices, :brand, foreign_key: true
    add_reference :devices, :device, foreign_key: {to_table: :devices}
    add_reference :devices, :office, foreign_key: true
    add_reference :devices, :category, foreign_key: true

    add_reference :offices, :company, foreign_key: true

    add_reference :groups, :user, foreign_key: true

    add_reference :group_users, :group, foreign_key: true
    add_reference :group_users, :user, foreign_key: true
    
    add_reference :requests, :user, foreign_key: true
    add_reference :requests, :device , foreign_key: true

    add_reference :user_confirm_devices, :user_device, foreign_key: true

    add_reference :device_histories, :device, foreign_key: true

    add_reference :user_devices, :user, foreign_key: true
    add_reference :user_devices, :device, foreign_key: true
  end
end
