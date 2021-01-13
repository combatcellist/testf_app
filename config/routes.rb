Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :profiles, only: [:show, :new, :create, :update, :edit]
  root 'welcome#index'
  
end
