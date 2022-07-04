Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  devise_for :users
  root to: 'items#index'

  resources :users, only: :show do
    resources :items, only: [:new, :create, :index, :show]
    end
  end
