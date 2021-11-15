class Api::V1::ActivitiesController < ApplicationController
  def show
    if params[:destination].present?
      activities = ActivityFacade.activities_for(params[:destination])
      render json: ActivitiesSerializer.new(activities)
    else
      bad_request
    end
  end
end
