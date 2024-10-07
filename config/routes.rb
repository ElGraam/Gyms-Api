Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'login', to: 'sessions#create'
  resources :members
  resources :payment_methods, only: [:index, :show]
  resources :membership_plans, only: [:index, :show]
  resources :membership_statuses, only: [:index, :show]

  resources :payments
  resources :usage_histories
  resources :equipment_reservations  
  
end
