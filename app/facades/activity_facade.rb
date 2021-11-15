class ActivityFacade
  def self.activities_for(destination)
    activities = ActivityService.activities_for(destination)
    Activity.new(activities)
  end
end
