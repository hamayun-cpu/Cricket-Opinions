Rails.application.routes.draw do
  resources :opinions
  devise_for :users
  resources :users, only: %i[index show]
  root 'opinions#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
