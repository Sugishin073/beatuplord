Rails.application.routes.draw do
  devise_for :users
    root "beats#index"
    resources :beats, only: [:index, :new, :create]
end
