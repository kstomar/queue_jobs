module LoginModule

  def login_user
    before(:each) do
      user = create(:user)
      payload = { user_id: user.id }
      secret_key = Rails.application.secret_key_base
      token = JWT.encode(payload, secret_key, 'HS512')
      request.headers['Authorization'] = token
    end
  end

end
