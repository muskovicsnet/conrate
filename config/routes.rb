Rails.application.routes.draw do
  get '/', to: 'home#index', as: :home

  mount Conrateblogs::Engine => '/conrateblogs'
  mount ConrateFlip::Engine => '/conrateflip'
  mount Conrategalleries::Engine => '/conrategalleries'
  mount Conratejobs::Engine => '/conratejobs'
  mount Conratemenus::Engine => '/conratemenus'
  mount Conratepages::Engine => '/conratepages'
  mount Conratesecurity::Engine => '/conratesecurity'
  mount Conratesettings::Engine => '/conratesettings'
  mount Conratethemes::Engine => '/conratethemes'
  mount Conratewebshop::Engine => '/conratewebshop'
  mount Notifications::Engine => '/notifications'
  mount Btemplater::Engine => '/btemplater'
#  mount Pamer::Engine => '/pamer'
end
