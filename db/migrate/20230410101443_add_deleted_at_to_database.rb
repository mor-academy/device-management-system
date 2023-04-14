class AddDeletedAtToDatabase < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_column :requests, :deleted_at, :datetime
    add_index :requests, :deleted_at

    add_column :device_histories, :deleted_at, :datetime
    add_index :device_histories, :deleted_at

    add_column :devices, :deleted_at, :datetime
    add_index :devices, :deleted_at

    add_column :brands, :deleted_at, :datetime
    add_index :brands, :deleted_at

    add_column :categories, :deleted_at, :datetime
    add_index :categories, :deleted_at

    add_column :offices, :deleted_at, :datetime
    add_index :offices, :deleted_at

    add_column :companies, :deleted_at, :datetime
    add_index :companies, :deleted_at

    add_column :office_infos, :deleted_at, :datetime
    add_index :office_infos, :deleted_at

    add_column :groups, :deleted_at, :datetime
    add_index :groups, :deleted_at

    add_column :group_users, :deleted_at, :datetime
    add_index :group_users, :deleted_at

    add_column :user_devices, :deleted_at, :datetime
    add_index :user_devices, :deleted_at

    add_column :user_confirm_devices, :deleted_at, :datetime
    add_index :user_confirm_devices, :deleted_at
  end
end
