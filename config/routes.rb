Rails.application.routes.draw do
  devise_for :users
  get 'infos/index'
  root to: 'infos#index'
  resources :infos, only: [:index, :new, :create]
end
