Rails.application.routes.draw do
  resources :exchange, only: [:show]
end
