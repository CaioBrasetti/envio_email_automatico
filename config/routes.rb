Rails.application.routes.draw do
  devise_for :users
  get 'mes/index'
  get 'mes/mes'
   
  resources :nivers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "nivers#index"
   
end
