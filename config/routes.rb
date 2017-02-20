Sidekiq::ProcessHealth::Check::Engine.routes.draw do
  get '/health/sidekiq', to: 'mountable#show'
  root to: 'mountable#show'
end
