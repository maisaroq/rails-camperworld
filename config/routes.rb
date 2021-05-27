Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :listings do
    collection do
      get :my_listings
    end
    resources :reservations, only: [ :index, :new, :create] do # for show we just need the id, doesn't to be inside of the loop
      get :my_reservations
    end
  end # the show will never be used, I'll use the show of listings
end
