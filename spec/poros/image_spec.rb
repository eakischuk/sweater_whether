require 'rails_helper'

RSpec.describe Image do
  before(:each) do
    @search_results = {:total=>2627,
 :total_pages=>2627,
 :results=>
  [{:id=>"EWJcM7LvVvg",
    :created_at=>"2021-10-17T17:49:50-04:00",
    :updated_at=>"2021-11-13T05:31:39-05:00",
    :promoted_at=>nil,
    :width=>6144,
    :height=>3456,
    :color=>"#c07340",
    :blur_hash=>"LjMhl4%157sA0hIqt6WqIpayt7oL",
    :description=>"8pm curfew was lifted.",
    :alt_description=>nil,
    :urls=>
     {:raw=>
       "https://images.unsplash.com/photo-1634507307973-9df1b23f5701?ixid=MnwyNzU0ODJ8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfDB8fHwxNjM2ODY1MTkz&ixlib=rb-1.2.1",
      :full=>
       "https://images.unsplash.com/photo-1634507307973-9df1b23f5701?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzU0ODJ8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfDB8fHwxNjM2ODY1MTkz&ixlib=rb-1.2.1&q=85",
      :regular=>
       "https://images.unsplash.com/photo-1634507307973-9df1b23f5701?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU0ODJ8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfDB8fHwxNjM2ODY1MTkz&ixlib=rb-1.2.1&q=80&w=1080",
      :small=>
       "https://images.unsplash.com/photo-1634507307973-9df1b23f5701?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU0ODJ8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfDB8fHwxNjM2ODY1MTkz&ixlib=rb-1.2.1&q=80&w=400",
      :thumb=>
       "https://images.unsplash.com/photo-1634507307973-9df1b23f5701?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU0ODJ8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfDB8fHwxNjM2ODY1MTkz&ixlib=rb-1.2.1&q=80&w=200"},
    :links=>
     {:self=>"https://api.unsplash.com/photos/EWJcM7LvVvg",
      :html=>"https://unsplash.com/photos/EWJcM7LvVvg",
      :download=>
       "https://unsplash.com/photos/EWJcM7LvVvg/download?ixid=MnwyNzU0ODJ8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfDB8fHwxNjM2ODY1MTkz",
      :download_location=>
       "https://api.unsplash.com/photos/EWJcM7LvVvg/download?ixid=MnwyNzU0ODJ8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfDB8fHwxNjM2ODY1MTkz"},
    :categories=>[],
    :likes=>1,
    :liked_by_user=>false,
    :current_user_collections=>[],
    :sponsorship=>nil,
    :topic_submissions=>{:"current-events"=>{:status=>"rejected"}},
    :user=>
     {:id=>"6fM0nTrpvTI",
      :updated_at=>"2021-11-13T23:30:49-05:00",
      :username=>"dillydallying",
      :name=>"Dillon Wanner",
      :first_name=>"Dillon",
      :last_name=>"Wanner",
      :twitter_username=>nil,
      :portfolio_url=>"https://dillydally.myportfolio.com",
      :bio=>
       "Artist, Photographer, cinematographer living in Denver, Co. \r\nMy photos are a small glimpse of what I’m feeling or that perspective at that time. Trying to communicate that with other humans. I love you.",
      :location=>"Denver Colorado",
      :links=>
       {:self=>"https://api.unsplash.com/users/dillydallying",
        :html=>"https://unsplash.com/@dillydallying",
        :photos=>"https://api.unsplash.com/users/dillydallying/photos",
        :likes=>"https://api.unsplash.com/users/dillydallying/likes",
        :portfolio=>"https://api.unsplash.com/users/dillydallying/portfolio",
        :following=>"https://api.unsplash.com/users/dillydallying/following",
        :followers=>"https://api.unsplash.com/users/dillydallying/followers"},
      :profile_image=>
       {:small=>
         "https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
        :medium=>
         "https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
        :large=>
         "https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},
      :instagram_username=>"Dillydally.ing",
      :total_collections=>0,
      :total_likes=>35,
      :total_photos=>104,
      :accepted_tos=>true,
      :for_hire=>true,
      :social=>
       {:instagram_username=>"Dillydally.ing", :portfolio_url=>"https://dillydally.myportfolio.com", :twitter_username=>nil, :paypal_email=>nil}},
    :tags=>[{:type=>"search", :title=>"denver"}, {:type=>"search", :title=>"co"}, {:type=>"search", :title=>"usa"}]}]}
    @background = Image.new(@search_results)
  end
  it 'exists and has attributes' do
    expect(@background.image_urls).to eq(@search_results[:results].first[:urls])
    expect(@background.credit[:user_name]).to eq(@search_results[:results].first[:user][:name])
    expect(@background.credit[:user_portfolio_url]).to eq(@search_results[:results].first[:user][:portfolio_url])
  end
end
