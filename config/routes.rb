Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:create]
      post '/login', to: "users#login"
      put '/update', to: "users#update"
      get '/show', to: "users#show"
      get 'articles/search', to: "articles#search"
      get 'doctors/search', to: "doctors#search"
      resources :articles
      resources :doctors
    end
  end
end
