Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :projects, only: [:index, :create, :show, :update, :destroy] do
        resources :tasks, only: [:index, :create, :update, :destroy]
      end
    end
  end

  # React SPA routes
  get "*path", to: "pages#index", constraints: ->(req) { !req.xhr? && req.format.html? }
  root "pages#index"
end
