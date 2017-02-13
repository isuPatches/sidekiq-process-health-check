module Sidekiq
  module ProcessHealth
    module Check
      class Engine < ::Rails::Engine
        isolate_namespace Sidekiq::ProcessHealth::Check
        require 'responders'
      end
    end
  end
end
