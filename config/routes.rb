Rails.application.routes.draw do
  root 'home#top'
  devise_for :users

  resources :pictures do
  	resource :favorites, only: [:create, :destroy]
  end

  resources :users do
  	resource :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
