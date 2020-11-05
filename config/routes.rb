Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "items#index"
  get '/categories/search', to: 'categories#search'
  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :users, only: [:show]
  resources :categories, only:[:index]
  resources :messages, only: [:create]
  # カード登録機能オミット中
  # resources :cards, only: [:new, :create]
end
