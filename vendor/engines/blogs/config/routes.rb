Conrateblogs::Engine.routes.draw do
  resources :blogs do
    collection do
      get :listformenu
      # TODO: match :q, to: 'pages#index', via: [:get, :post], as: :q
    end
    resources :posts
  end
end
