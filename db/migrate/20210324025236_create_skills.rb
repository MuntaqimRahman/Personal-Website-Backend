class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :languages, default: [] , array:true
      t.string :frameworks, default: [] , array:true
      t.string :tools, default: [] , array:true

      t.timestamps
    end
  end
end
