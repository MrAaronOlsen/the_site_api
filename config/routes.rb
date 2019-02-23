Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/authentication', to: 'authentication#create'
      get '/user', to: 'users#show'

      resources :abouts, only: [:index, :update]
      get '/abouts/current', to: 'abouts#current'
      put '/abouts/images/:id', to: 'abouts#images'

      resources :attachments, only: [:show, :index, :create]
      delete '/attachments', to: 'attachments#destroy'

      resources :current_versions, only: [:update]
    end
  end
end
