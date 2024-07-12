Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users

  resources :plants do
    collection do
      get 'mes-plantes'
    end
    resources :bookings, except: [:new] do
      resources :reviews, only: [:create]
    end
  end

  resources :bookings, only: [:index, :update, :destroy]


  # Static pages
  get 'about', to: 'pages#about'

end
