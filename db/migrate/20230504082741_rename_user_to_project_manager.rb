class RenameUserToProjectManager < ActiveRecord::Migration[7.0]
  def change
    rename_column :groups, :user_id, :project_manager_id
  end
end
