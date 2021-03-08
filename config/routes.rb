Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :portfolios do
    resources :reservations, only: [:new, :create] do
      resources :reviews, only: [:new, :create]
    end

    resources :favorites, only: [:new, :create]
  end

  resources :reservations, only: [:index, :show, :destroy, :update]
  resources :favorites, only: [:destroy]
end
