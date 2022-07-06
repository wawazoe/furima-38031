Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  devise_for :users
  root to: 'items#index'

  resources :users, only: :show 
  resources :items, only: [:new, :create, :index]
  end
