class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.text :title
      t.text :sub_description
      t.string :start_date
      t.string :end_date
      t.text :link
      t.string :body_points, default: [] , array:true

      t.timestamps
    end
  end
end
