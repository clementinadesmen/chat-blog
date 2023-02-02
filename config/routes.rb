Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get  '/profile',  to: 'profile#new'
  post   '/profile',   to: 'profile#create'
  resources :articles
  resources :profile
  # Defines the root path route ("/")
  # root "articles#index"
end
