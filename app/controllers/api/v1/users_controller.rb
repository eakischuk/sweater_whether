class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.api_key = key
    if bad_password
      render json: { error: 'Password and confirmation must match.' }, status: 400
    elsif bad_email
      render json: { error: 'Please enter a valid email.' }, status: 400
    else
      user.save
      render json: UserSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def key
    SecureRandom.urlsafe_base64
  end

  def bad_password
    user_params[:password] != user_params[:password_confirmation] || user_params[:password].nil?
  end

  def bad_email
    user_params[:email].nil? || User.find_by(email: user_params[:email]).present?
  end
end
