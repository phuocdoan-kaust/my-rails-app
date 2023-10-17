Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'brand', to: 'pages#brand'
  get 'product', to: 'pages#product'
  # get 'brand' => 'pages#brand'

  # Defines the root path route ("/")
  root 'pages#home'
end
