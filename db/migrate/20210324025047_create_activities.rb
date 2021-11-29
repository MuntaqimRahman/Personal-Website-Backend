class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.text :title
      t.text :sub_description
      t.datetime :start_date
      t.datetime :end_date
      t.text :link
      t.string :body_points, default: [] , array:true

      t.timestamps
    end
  end
end
