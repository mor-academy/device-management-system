class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :type, null: false, default: 0
      t.integer :status
      t.text :reason
      t.text :information

      t.timestamps
    end
  end
end
