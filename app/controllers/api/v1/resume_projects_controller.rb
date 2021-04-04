module Api
  module V1
    class ResumeProjectsController < ApplicationController
      before_action :admin_authentication, except: [:index]
      include ActionController::HttpAuthentication::Token


      # GET /resume_projects
      def index
        @resume_projects = ResumeProject.all

        render json: @resume_projects
      end

      # POST /resume_projects
      def create
        @resume_project = ResumeProject.new(resume_project_params)

        if @resume_project.save
          render json: @resume_project, status: :created
        else
          render json: @resume_project.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /resume_projects/1
      def update
        @resume_project = ResumeProject.find(params[:id]).update(resume_project_params)

        if @resume_project
          render json: @resume_project
        else
          render json: @resume_project.errors, status: :unprocessable_entity
        end
      end

      # DELETE /resume_projects/1
      def destroy
        @resume_project = ResumeProject.find(params[:id]).destroy!
        head :no_content
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_resume_project
          @resume_project = ResumeProject.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def resume_project_params
          params.require(:resume_project).permit(:title,:company,:start_date,:end_date,:link, body_points: [])
        end
    end
  end
end
