Rails.application.routes.draw do
  get 'users/:id', to: 'users#show', as: 'user'
  get 'brands/inactive', to: 'brands#inactive', as: 'inactive_brands'
  get 'products/inactive', to: 'products#inactive', as: 'inactive_products'
  get 'cards/requests', to: 'cards#index_request_card', as: 'card_requests'
  resources :cards do
    member do
      post :activate
    end
  end
  resources :products do
    get :inactive
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
