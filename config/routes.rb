VentrataTest::Engine.routes.draw do
  namespace :api do
    resources :purchases, only: [ :create ]
  end
end
