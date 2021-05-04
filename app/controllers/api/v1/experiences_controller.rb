module Api
  module V1
    class ExperiencesController < ApplicationController
      before_action :admin_authentication, except: [:index]
      include ActionController::HttpAuthentication::Token


      # GET /experiences
      def index
        @experiences = Experience.all

        render json: @experiences
      end

      # POST /experiences
      def create
        @experience = Experience.new(experience_params)

        if @experience.save
          render json: @experience, status: :created
        else
          render json: @experience.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /experiences/1
      def update

        @experience = Experience.find(params[:id]).update(experience_params)

        if @experience
          render json: @experience
        else
          render json: @experience.errors, status: :unprocessable_entity
        end
      end

      # DELETE /experiences/1
      def destroy
        @experience = Experience.find(params[:id]).destroy!
        head :no_content
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_experience
          @experience = Experience.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def experience_params
          params.require(:experience).permit(:title,:sub_description,:start_date,:end_date,:link, body_points: [])
        end
    end
  end
end