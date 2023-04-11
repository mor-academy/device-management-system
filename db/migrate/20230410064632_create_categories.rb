class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :status, null: false, default: 0
      
      t.timestamps
    end
  end
end
