Sidekiq::ProcessHealth::Check::Engine.routes.draw do
  resources :controller, only: :show
  root to: '#show'
end
