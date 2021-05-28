Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show, :edit, :update]

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :listings do
    collection do
      get :my_listings
    end
    resources :reservations, only: [ :index, :new, :create, :show] do 
      get :my_reservations
    end
  end 
end
