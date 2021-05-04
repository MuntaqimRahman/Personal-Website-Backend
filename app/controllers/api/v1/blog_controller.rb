module Api
  module V1

    class BlogController < ApplicationController

      include ActionController::HttpAuthentication::Token

      PAGINATION_LIMIT = 20
      before_action :admin_authentication, except: [:index, :show]


      def index

        fetched_param = params.fetch(:limit, PAGINATION_LIMIT).to_i;

        blogs = Blog.limit(fetched_param).offset(params[:offset]); #Blog is a model which inherits from ApplicationRecord which itself inherits from ActiveRecord

        render json: blogs 
      end

      def show
        blog = Blog.find(params[:id])
        
        #Default is 200 so no need to specify status
        render json: blog

      end

      def create #create a new blog entry
        newBlog = Blog.new(create_parameters)

        if(newBlog.save) 
          render json: newBlog,status: :created
        else
          render json: newBlog.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Blog.find(params[:id]).destroy!
        head :no_content
      end


      private 
      
      def create_parameters
        params.require(:blog).permit(:title, :description, imgs: [])
      end

    end
  end
end
