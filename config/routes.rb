Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
    #↪︎使用するアクションをresourcesに記載。
end
