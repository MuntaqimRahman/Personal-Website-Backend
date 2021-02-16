class BlogController < ApplicationController
  def index
    render json: Blog.all #Blog is a model which inherits from ApplicationRecord which itself inherits from ActiveRecord
  end

  def create
  end
end
