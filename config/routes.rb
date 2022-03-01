Rails.application.routes.draw do
  resources :products
  # devise_for :users
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :products do 
    resources :orders
  end

  resources :orders, only: [:index]
end
