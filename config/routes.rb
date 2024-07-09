Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :plants do
    resources :photos, only: [:create, :destroy]
    resources :reviews, only: [:create]
    member do
      post 'book'
    end
  end

  resources :reservations, only: [:index]

  get 'mes_reservations', to: 'reservations#my_reservations'

  # Static pages
  get 'about', to: 'pages#about'
end
