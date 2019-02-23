class JwtToken

  class << self
    def encode(payload, experation = 100 * 3600)
      payload[:exp] = Time.now.to_i + experation
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
    end

    def decode(token)
      JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
    end
  end
end