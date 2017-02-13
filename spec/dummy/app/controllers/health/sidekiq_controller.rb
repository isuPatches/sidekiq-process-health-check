module Health
  class SidekiqController < ApplicationController
    respond_to :json
    include Sidekiq::ProcessHealth::Check::Controller
  end
end