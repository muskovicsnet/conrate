require 'que/web'

Conratejobs::Engine.routes.draw do
  constraints ->(request) { request.env['warden'].authenticate? && request.env['warden'].user.has_role?(:conratesecurity_admin) } do
    mount Que::Web => '/que', as: 'que'
  end
end
