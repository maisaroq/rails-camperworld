Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :listings do

    resources :reservations, only: [ :index, :new, :create] # for show we just need the id, doesn't to be inside of the loop
  end # the show will never be used, I'll use the show of listings
end
