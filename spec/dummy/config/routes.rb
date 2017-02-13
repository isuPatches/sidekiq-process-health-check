Rails.application.routes.draw do
  #mount Sidekiq::Process::Check::Engine => '/health/sidekiq'

  namespace :health do
    get '/sidekiq', :to => 'sidekiq#show'
  end
end
