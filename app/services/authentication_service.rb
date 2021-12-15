require 'jwt'

class AuthenticationService
    KEY_BASE = Rails.application.secrets.secret_key_base
    ALGORITHM_TYPE = 'HS512'

    def self.encode(user_id)
        payload = {user_id: user_id}

        JWT.encode payload, KEY_BASE, ALGORITHM_TYPE  
    end

    def self.decode(token)

        decoded_token = JWT.decode token,KEY_BASE, true, { algorithm: ALGORITHM_TYPE}

        return decoded_token[0]['user_id']

    end
end