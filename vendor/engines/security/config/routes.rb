Conratesecurity::Engine.routes.draw do
  resources :users do
    post 'deactivate', to: 'users#deactivate', as: 'deactivate'
  end
  devise_for :users, class_name: Conratesecurity::User, module: :devise, controllers: { omniauth_callbacks: 'conratesecurity/omniauth_callbacks' }, path: 'auth'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup
  get '/social_sign_in' => 'users#social_sign_in', as: :social_sign_in
  resources :roles
end
