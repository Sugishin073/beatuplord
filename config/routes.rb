Rails.application.routes.draw do
    resources :beats, only: [:index, :new, :create]
end
