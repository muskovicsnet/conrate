Conratewebshop::Engine.routes.draw do
  resources :categories do
    collection do
      get :listformenu
      # TODO: match :q, to: 'pages#index', via: [:get, :post], as: :q
    end
    resources :products do
      resources :line_items
    end
  end
  resources :quantity_units do
    get 'convert/:to_id/:quantity/:price', to: 'quantity_units#convert', as: 'convert'
  end
  resources :carts
  resources :orders do
    post 'success', to: 'orders#success', as: 'success'
  end
  resources :pricemanipulators
end
