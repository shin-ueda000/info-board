Rails.application.routes.draw do
  devise_for :users
  root to: 'infos#index'
  resources :infos do
    resources :comments, only: :create
  end
end
