Rails.application.routes.draw do
  mount Sidekiq::ProcessHealth::Check::Engine => '/mountable'

  namespace :health do
    get '/sidekiq', :to => 'sidekiq#show'
  end
end
