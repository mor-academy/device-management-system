class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.text :description
      t.float :price, null: false, default: 0
      t.text :source, null: false
      t.integer :status, null: false, default: 0
      t.text :images
      t.string :brand, null: false
      t.timestamps
    end
  end
end
