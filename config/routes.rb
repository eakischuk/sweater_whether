Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#show'
      get 'backgrounds', to: 'images#show'
      resource :users, only: [:create]
      post '/sessions', to: 'sessions#create'
    end
  end
end
