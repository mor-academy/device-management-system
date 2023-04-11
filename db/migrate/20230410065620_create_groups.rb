class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :project_name, null: false
      
      t.timestamps
    end
  end
end
