Rails.application.routes.draw do
    root 'arenas#index'
    resources :arenas, only: [:index]
    resources :characters
    resources :battles
end
