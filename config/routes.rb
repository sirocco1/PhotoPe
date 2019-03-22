Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	resource :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
    get :favorites, on: :member
    get :homes, on: :member
  end
  resources :pictures do
    resource :favorites, only: [:create, :destroy]
    resources :comments
  end
  resources :genres, only: [:create]
  root 'home#top'
  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
