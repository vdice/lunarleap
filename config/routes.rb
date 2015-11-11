Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :users do
    resources :challenges
  end

  resources :challenges do
    resources :updates
  end

  resources :users do
    resources :subscriptions
  end
end
