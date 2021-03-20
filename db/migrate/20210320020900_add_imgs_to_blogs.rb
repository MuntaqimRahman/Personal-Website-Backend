class AddImgsToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :imgs, :string, default: [], array: true
  end
end
