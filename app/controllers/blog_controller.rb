class BlogController < ApplicationController

  private def create_parameters
    params.require(:blog).permit(:blog_title, :blog_content)
  end

  def index
    render json: Blog.all #Blog is a model which inherits from ApplicationRecord which itself inherits from ActiveRecord
  end

  def create #create a new blog entry
    newBlog = Blog.new(create_parameters)

    if(newBlog.save)
      render status: :created
    else
      render json: newBlog.errors, status: :unproccessable_entity
    end
  end
end
