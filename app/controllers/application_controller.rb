class ApplicationController < ActionController::Base

  def format_activerecord_errors(errors)
    errors.map do |attribute, error|
      { attribute => error }
    end
  end

  private
  
  def token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, secret_key, 'HS512')
  end

  def secret_key
    Rails.application.secret_key_base
  end

  def client_has_valid_token?
    !!current_user_id
  end

  def current_user_id
    begin
      token = request.headers["Authorization"]
      decoded_array = JWT.decode(token, secret_key, true, { algorithm: 'HS512' })
      payload = decoded_array.first
    rescue #JWT::VerificationError
      return nil
    end
    payload["user_id"]
  end

  def verify_authenticity_token
    render json: {error: 'Unauthorized'}, status: :unauthorized if !client_has_valid_token?
  end

end
