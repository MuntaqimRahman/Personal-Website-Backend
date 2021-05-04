module Api
  module V1
    class ActivitiesController < ApplicationController
      before_action :admin_authentication, except: [:index]
      include ActionController::HttpAuthentication::Token

      # GET /activities
      def index
        @activities = Activitie.all

        render json: @activities
      end

      # POST /activities
      def create
        @activitie = Activitie.new(activitie_params)

        if @activitie.save
          render json: @activitie, status: :created
        else
          render json: @activitie.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /activities/1
      def update
        @activitie = Activitie.find(params[:id]).update(activitie_params)

        if @activitie
          render json: @activitie
        else
          render json: @activitie.errors, status: :unprocessable_entity
        end
      end

      # DELETE /activities/1
      def destroy
        @activitie = Activitie.find(params[:id]).destroy!
        head :no_content
      end

      private

        # Only allow a trusted parameter "white list" through.
        def activitie_params
          params.require(:activity).permit(:title,:sub_description,:start_date,:end_date,:link, body_points: [])
        end
    end
  end
end
