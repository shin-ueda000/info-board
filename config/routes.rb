Rails.application.routes.draw do
  get 'infos/index'
  root to: 'infos#index'
  resources :infos, only: :index
end
