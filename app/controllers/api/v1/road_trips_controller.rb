class Api::V1::RoadTripsController < ApplicationController
  def create
    if authorized
      if params[:origin].present? && params[:destination].present?
        trip = RoadTripFacade.road_trip(params[:origin], params[:destination])
        render json: RoadtripSerializer.new(trip)
      else
        bad_request
      end
    else
      render json: { error: 'Unauthorized' }, status: 401
    end
  end

  private

  def authorized
    user = User.find_by(api_key: params[:api_key])
    !user.nil?
  end
end
