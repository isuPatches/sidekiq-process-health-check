module Sidekiq
  module ProcessHealth
    module Check
      class MountableController < ApplicationController
        respond_to :json
        include Sidekiq::ProcessHealth::Check::Controller
      end
    end
  end
end