class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.text "title", limit: 100, null: false
      t.text "description", null: false
      t.timestamps
    end
  end
end
