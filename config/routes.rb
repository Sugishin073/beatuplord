Rails.application.routes.draw do
    root "beats#index"
    resources :beats, only: [:index, :new, :create]
end
