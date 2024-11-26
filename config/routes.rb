Rails.application.routes.draw do
  devise_for :users
  root "beats#index"
  
  resources :beats, only: [:index, :new, :create, :destroy, :edit, :update] do
    member do
      get 'delete', to: 'beats#destroy'
    end
  end

  # ユーザーのルートはトップレベルで独立させる
  resources :users, only: [:show, :edit, :update]

  resources :rooms, only: [:create, :show] do
    resources :messages, only: [:create]
  end
end
