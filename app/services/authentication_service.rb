require 'jwt'

class AuthenticationService
    HMAC_SECRET_KEY = Rails.application.secrets.HMAC_SECRET_KEY
    ALGORITHM_TYPE = 'HS512'

    def self.encode(user_id)
        payload = {user_id: user_id}

        JWT.encode payload, HMAC_SECRET_KEY, ALGORITHM_TYPE  
    end

    def self.decode(token)

        decoded_token = JWT.decode token,HMAC_SECRET_KEY, true, { algorithm: ALGORITHM_TYPE}

        return decoded_token[0]['user_id']

    end
end