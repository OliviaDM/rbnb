Rails.application.routes.draw do
  root to: 'pages#home'
  resources :beasts
  resources :booking, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :sucker, only: [:show, :new, :create, :edit, :update]
  resources
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
