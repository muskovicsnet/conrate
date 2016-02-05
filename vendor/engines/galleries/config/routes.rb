Conrategalleries::Engine.routes.draw do
  resources :galleries do
    collection do
      get :listformenu
      match :q, to: 'galleries#index', via: [:get, :post], as: :q
    end
  	resources :photos
  	post 'save_order' => 'galleries#save_order', as: 'save_order'
  end
end
