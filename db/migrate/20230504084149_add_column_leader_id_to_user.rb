class AddColumnLeaderIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :leader_id, :bigint
  end
end
