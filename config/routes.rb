Rails.application.routes.draw do
  resources :products do
    member do
      get :switch_state
    end
  end
  resources :brands do
    member do
      get :switch_state
    end
  end
  ActiveAdmin.routes(self)
  devise_for :users, path: '', path_names: {
    sign_in: 'signin',
    sign_out: 'signout',
    sign_up: 'signup'
  }
  # as :user do
  #   get 'signin', to: 'devise/session#new'
  #   delete 'signout', to: 'devise/session#destroy'
  #   get 'signup', to: 'devise/registration#new'
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
end
