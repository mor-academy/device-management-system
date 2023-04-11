class AddReferancesToDatabase < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :offices, foreign_key: true

    add_reference :devices, :offices, foreign_key: true
    add_reference :devices, :categories, foreign_key: true

    add_reference :device_accessories, :devices, foreign_key: true
    add_reference :device_accessories, :accessories, foreign_key: true

    add_reference :accessories, :brands, foreign_key: true

     
    add_reference :offices, :companies, foreign_key: true

    add_reference :groups, :users, foreign_key: true

    add_reference :group_users, :groups, foreign_key: true
    add_reference :group_users, :users, foreign_key: true
    
    add_reference :requests, :users, foreign_key: true
    add_reference :requests, :devices , foreign_key: true

    add_reference :user_confirm_devices, :user_devices , foreign_key: true

    add_reference :device_histories, :devices , foreign_key: true

    add_reference :user_devices, :users, foreign_key: true
    add_reference :user_devices, :devices, foreign_key: true
  end
end
