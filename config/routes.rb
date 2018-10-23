Rails.application.routes.draw do
  resources :shows
  devise_for :users
  resources :people
  root 'people#index'
end
