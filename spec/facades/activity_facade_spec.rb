require 'rails_helper'

RSpec.describe ActivityFacade, :vcr do
  it 'receives destination and returns poro' do
    activities = ActivityFacade.activities_for('Denver, CO')
    expect(activities).to be_an(Activity)
  end
end
