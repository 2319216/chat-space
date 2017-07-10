Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :groups,except: [:show,:destroy] do
    resources :messages,only: :index
  end
  resources :users, only: [:edit, :update]
  root to: "groups#index"
end
