Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
<<<<<<< HEAD
  resources :items, only: [:new, :create, :index]
=======
  resources :items, only: [:new, :create, :index, :show, :edit]
>>>>>>> acabf76 (商品一覧表示　実装)
  end
