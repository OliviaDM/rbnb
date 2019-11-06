Rails.application.routes.draw do
  devise_for :suckers

  root to: 'pages#home'
  resources :beasts do
    member do
      resources :bookings, only: [:show, :new, :create, :edit, :update, :destroy] do
        member do
          resources :reviews, only: [:new, :create, :edit, :update, :destroy]
        end
      end
    end
  end
  resources :suckers, only: [:show, :new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
