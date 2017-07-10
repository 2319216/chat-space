Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "groups#index"

  resources :groups,except: [:show,:destroy] do
    resources :messeges,only: :index
  end
  resources :users, only: [:edit, :update]

end
