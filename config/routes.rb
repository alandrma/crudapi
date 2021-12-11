Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:create]
      post '/login', to: "users#login"
      put '/update', to: "users#update"
      get '/show', to: "users#show"
      resources :articles
      get 'articles/search', action: :search, controller: 'articles'
      resources :doctors
      get 'doctors/search', action: :search, controller: 'doctors'

    end
  end
end
