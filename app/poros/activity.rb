class Activity
  attr_reader :id, :destination, :forecast, :activities
  def initialize(activities)
    @id = nil
    @destination = activities[:destination]
    @forecast = activities[:forecast]
    @activities = format_activities(activities[:activities])
  end

  def format_activities(activities)
    activities.map do |activity|
      {
        title: activity[:activity],
        type: activity[:type],
        participants: activity[:participants],
        price: activity[:price]
      }
    end
  end
end
