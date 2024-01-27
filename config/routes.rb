Rails.application.routes.draw do
  root 'home#index'
  resources :therapists, only: [:index]
  get '*path', to: 'errors#not_found', via: :all
end
