Rails.application.routes.draw do
  resources :shows do
    resources :episodes, only: [:show]
  end

  devise_for :users
  resources :people
  root 'shows#index'
end
