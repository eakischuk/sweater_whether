class RoadTripFacade
  def self.road_trip(from, to)
    response = RoadTripService.road_trip(from, to)
    RoadTrip.new(response)
  end
end
