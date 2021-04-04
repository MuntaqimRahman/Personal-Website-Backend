module Api
  module V1
    class SkillsController < ApplicationController
      before_action :admin_authentication, except: [:index]
      include ActionController::HttpAuthentication::Token


      # GET /skills
      def index
        @skills = Skill.all

        render json: @skills
      end

      # POST /skills
      def create
        @skill = Skill.new(skill_params)

        if @skill.save
          render json: @skill, status: :created
        else
          render json: @skill.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /skills/1
      def update
        @skill = Skill.find(params[:id]).update(skill_params)

        if @skill
          render json: @skill
        else
          render json: @skill.errors, status: :unprocessable_entity
        end
      end

      # DELETE /skills/1
      def destroy
        @skill = Skill.find(params[:id]).destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_skill
          @skill = Skill.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def skill_params
          params.fetch(:skill).permit(languages: [],tools: [] ,frameworks: [])
        end
    end
  end
end
