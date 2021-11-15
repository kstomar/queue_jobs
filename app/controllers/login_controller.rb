class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    user = User.find_by("lower(email) = ?", user_params[:username].downcase)
    if user && user.authenticate(user_params[:password])
      render json: { token: token(user.id), user_id: user.id }, status: 200 
    else 
      render json: { errors: [ "Sorry, incorrect username or password" ] }, status: :unprocessable_entity
    end 
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
