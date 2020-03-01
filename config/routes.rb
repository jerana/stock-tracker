Rails.application.routes.draw do
  resources :user_stocks, only: [:create,:destroy]
  devise_for :users
  get 'welcome/index'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'
  get 'search_stock', to: 'stocks#search'
  get 'chart', to: 'stocks#chart'
end
