class CreateUserSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_subscriptions do |t|
      t.references :user, foreign_key: true
      t.string :endpoint
      t.json :keys
      t.datetime :expiration_time
      t.integer :status

      t.timestamps
    end
  end
end
