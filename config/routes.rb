Rails.application.routes.draw do
  resources :episodes, only: [:index, :show]
  resources :shows
  devise_for :users
  resources :people
  root 'people#index'
end
