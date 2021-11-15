require 'rails_helper'

RSpec.describe Activity do
  before(:each) do
    @activity_data = {
      :destination=>"Denver, CO",
      :forecast=>{:temperature=>67.84, :summary=>"clear sky"},
      :activities=>
        [{
          :activity=>"Draw and color a Mandala",
          :type=>"relaxation",
          :participants=>1,
          :price=>0.05,
          :link=>"https://en.wikipedia.org/wiki/Mandala",
          :key=>"4614092",
          :accessibility=>0.1},
        {
          :activity=>"Practice coding in your favorite lanaguage",
          :type=>"recreational",
          :participants=>1,
          :price=>0,
          :link=>"",
          :key=>"7096020",
          :accessibility=>0.1}
        ]}
    @activity = Activity.new(@activity_data)
  end
  it 'exists and has attributes' do
    formated_activities = [
      {
        title: "Draw and color a Mandala",
        type: 'relaxation',
        participants: 1,
        price: 0.05
      },
      {
        title: "Practice coding in your favorite lanaguage",
        type: 'recreational',
        participants: 1,
        price: 0
      }
    ]
    expect(@activity.id).to be(nil)
    expect(@activity.destination).to eq("Denver, CO")
    expect(@activity.forecast[:temperature]).to eq(67.84)
    expect(@activity.forecast[:summary]).to eq('clear sky')
    expect(@activity.activities).to eq(formated_activities)
  end
end
