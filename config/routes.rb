Sidekiq::ProcessHealth::Check::Engine.routes.draw do
  get '/sidekiq', to: 'mountable#show'
  root to: 'mountable#show'
end
