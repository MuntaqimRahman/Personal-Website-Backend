class AddImgsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :imgs, :string, default: [], array: true
  end
end
