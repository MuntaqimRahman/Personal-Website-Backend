module Api
  module V1
    class ProjectsController < ApplicationController

        include ActionController::HttpAuthentication::Token

        #Scaffolded API actions

        PAGINATION_LIMIT = 30
        before_action :admin_authentication, except: [:index, :show]
        # GET /projects
        def index
          fetched_param = params.fetch(:limit, PAGINATION_LIMIT).to_i;
          @projects = Project.limit(fetched_param).offset(params[:offset]);

          render json: @projects
        end

        #GET /projects/1
        def show
          @project = Project.find(params[:id])

          render json: @project
        end

        # POST /projects
        def create
          @project = Project.new(project_params)

          if @project.save
            render json: @project, status: :created
          else
            render json: @project.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /projects/1
        def update

          @project = Project.find(params[:id]).update(project_params)

          if @project
            render json: @project
          else
            render json: @project.errors, status: :unprocessable_entity
          end
        end

        # DELETE /projects/1
        def destroy
          @project = Project.find(params[:id]).destroy!
          head :no_content

        end

        private

          # Only allow a trusted parameter "white list" through.
          def project_params
            params.require(:project).permit(:title, :description, imgs: [])
          end

         
      end
    end
  end
