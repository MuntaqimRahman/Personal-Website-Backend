class ApplicationController < ActionController::API
    # include ExceptionHandler
    rescue_from ActiveRecord::RecordNotDestroyed, with: :destroy_exception_handler
    rescue_from JWT::VerificationError, JWT::ExpiredSignature,JWT::DecodeError, with: :signature_error_handler


    def limiter(fetched_param)
        return [
          fetched_param, 
          PAGINATION_LIMIT
        ].min
      end

    def admin_authentication
    token, _options = token_and_options(request) #Not using options for now

    user_id = AuthenticationService.decode(token)

    Admin.find(user_id)

    rescue ActiveRecord::RecordNotFound
    head :unauthorized

    end

    private 
    
    def destroy_exception_handler(err)
        render json: {errors: err.record.errors}, status: :unprocessable_entity
    end

    def signature_error_handler(err)
        render json: {errors: err}, status: :unauthorized
    end
end
