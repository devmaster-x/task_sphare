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
end
