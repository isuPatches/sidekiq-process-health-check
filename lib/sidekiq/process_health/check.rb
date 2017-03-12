require 'sidekiq/process_health/check/version'
require 'sidekiq/process_health/check/engine'
require 'sidekiq/process_health/check/configuration'
require 'sidekiq/api'

module Sidekiq
  module ProcessHealth
    module Check

      class << self
        attr_writer :configuration

        def configuration
          @configuration ||= Configuration.new
        end

        def reset
          @configuration = Configuration.new
        end

        def configure
          yield(configuration)
        end
      end

      def number_of_active_processes
        retrieve_active_processes.size
      end

      def number_of_enqueued_jobs
        Sidekiq::Queue.new.size
      end

      def retrieve_active_processes
        processes = []
        Sidekiq::ProcessSet.new.each do |process|
          processes << process
        end
        processes
      end
    end
  end
end
