Conratepages::Engine.routes.draw do
  resources :pages do
    collection do
      get :listformenu
      # TODO: match :q, to: 'pages#index', via: [:get, :post], as: :q
    end
  end
end
