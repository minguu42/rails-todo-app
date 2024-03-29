class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :done, null: false, default: false
      t.integer :color_id, null: false

      t.timestamps
    end
  end
end
