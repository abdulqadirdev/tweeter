require 'sidekiq/web'

Rails.application.routes.draw do
  get 'profile/show'

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  root to: 'tweets#index'
  resources :tweets, except: [:edit, :update] do
    resources :comments, only: [:create, :destroy] 
    member do
      post 'retweet'
    end 
  end
  resources :profiles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
