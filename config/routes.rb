Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users,except:[:new, :create] do
  	resource :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
    get :favorites, on: :member
    get :homes, on: :member
    get :message, on: :member
  end
  resources :pictures,only:[:index, :show, :create,:destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :genres, only: [:create]
  resources :messages, only: [:create, :index]
  resources :rooms, only: [:create, :show, :index]
  root 'home#top'
  get 'home/about'
  get 'home/sample'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
