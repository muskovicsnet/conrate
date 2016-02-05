Conratemenus::Engine.routes.draw do
  resources :menuabletypes
  resources :menus do
    collection do
      # get :manage
      post :rebuild
    end
  end
end
