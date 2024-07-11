Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users

  resources :plants do
    # resources :photos, only: [:create, :destroy]
    resources :bookings, except: [:new] do
      resources :reviews, only: [:create]
    end
  end

  resources :bookings, only: [:index]

  get 'mes_bookings', to: 'bookings#my_bookings'

  # Static pages
  get 'about', to: 'pages#about'
  get 'login', to: 'pages#login'
  get 'faq', to: 'pages#faq'
end
