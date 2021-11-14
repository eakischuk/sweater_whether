class ApplicationController < ActionController::API

  private
  
  def bad_request
    render json: { error: "400 Bad Request" }, status: 400
  end
end
