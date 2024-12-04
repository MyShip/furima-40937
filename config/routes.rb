Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only:[:edit, :index, :new, :create, :update, :show, :destroy] do
    resources :orders, only:[:index,:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
