class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      bad_credentials
    else
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: UserSerializer.new(user)
      else
        bad_credentials
      end
    end
  end

  private

  def bad_credentials
    render json: { error: 'Bad credentials' }, status: 400
  end
end
