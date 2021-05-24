Rails.application.routes.draw do
  devise_for :listings
  devise_for :users
  root to: 'pages#home'
  resources :listings, only: [:index, :new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
