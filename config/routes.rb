Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:create]
      post '/login', to: "users#login"
      put '/update', to: "users#update"
      get '/show', to: "users#show"
      resources :artikels
      resources :lists
    end
  end
end
