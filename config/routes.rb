Rails.application.routes.draw do
  get 'users/:id', to: 'users#show', as: 'user'
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
  root 'pages#home'
end
