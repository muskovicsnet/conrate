ConrateFlip::Engine.routes.draw do
  constraints lambda { |request| ConrateFlip::CheckRight.check?(request) } do
    mount Flip::Engine => '/flip', as: :flip
  end
end
