Rails.application.routes.draw do
  devise_for :users
    root "beats#index"
    resources :beats, only: [:index, :new, :create, :destroy, :edit, :update]do
    member do
      get 'delete', to: 'beats#destroy'
    resources :users, only: [:show, :edit, :update]
    end
  end
end