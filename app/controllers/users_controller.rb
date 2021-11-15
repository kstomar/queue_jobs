class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { errors: format_activerecord_errors(user.errors) },
        status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:users).permit(:name, :email, :password)
    end
end
