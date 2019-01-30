Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :contents, only: [:index, :update]
    end
  end
end
