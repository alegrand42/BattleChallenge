Rails.application.routes.draw do
    root 'arenas#index'
    resources :characters
    resources :battles
end
