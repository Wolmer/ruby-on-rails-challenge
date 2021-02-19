Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  resources :courses, only: [:index], format: "json"
  resources :offers, only: [:index], format: "json"
end
