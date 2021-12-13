module Api
    module V1
        class AuthenticationController < ApplicationController

        class AuthError < StandardError; end #Initialize the authentication error I'm raising

        rescue_from ActionController::ParameterMissing, with: :auth_missing_param_error_handler
        rescue_from AuthError, with: :unauthorized_handler
        def create

            raise AuthError unless admin.authenticate(password_parameters)

            token = AuthenticationService.encode(admin.id)

            render json: {token: token}, status: :created
        end


        private 

        def admin
            # puts "ADMIN"
            @admin ||= Admin.find_by(username: user_parameters) #Memoize finding admin and assign to instance variable
        end

        def auth_missing_param_error_handler(err)
            render json: {errors: err.messages}, status: :unprocessable_entity
        end

        def unauthorized_handler
            head :unauthorized
        end

        def user_parameters
            params.require(:username)
        end

        def password_parameters
            params.require(:password)
        end

        end
    end
end