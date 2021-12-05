class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title, limit: 100, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
