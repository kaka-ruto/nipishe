module Helpers
  module AuthSpecHelper
    def token_generator(user_id)
      JsonWebToken.encode(user_id: user_id)
    end


    def expired_token_generator(user_id)
      JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
    end

    # return headers
    def valid_headers
      {
        'Authorization' => token_generator(user.id),
        'content-type' => 'application/json'
      }
    end

    def invalid_headers
      {
        'Authorization' => nil,
        'content-type' => 'application/json'
      }
    end
  end
end
