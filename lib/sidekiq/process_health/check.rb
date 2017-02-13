require 'sidekiq/process_health/check/version'
require 'sidekiq/process_health/check/engine'
require 'sidekiq/api'

module Sidekiq
  module ProcessHealth
    module Check

      DEFAULT_JOB_THRESHOLD = 50

      DEFAULT_EXPECTED_PROCESS_NUMBER = 1

      def expected_number_of_processes
        if ENV['SIDEKIQ_PROCESS_CHECK_EXPECTED_PROCESS_NUMBER'].present?
          ENV['SIDEKIQ_PROCESS_CHECK_EXPECTED_PROCESS_NUMBER'].to_i
        else
          DEFAULT_EXPECTED_PROCESS_NUMBER
        end
      end

      def job_threshold
        if ENV['SIDEKIQ_PROCESS_CHECK_JOB_THRESHOLD'].present?
          ENV['SIDEKIQ_PROCESS_CHECK_JOB_THRESHOLD'].to_i
        else
          DEFAULT_JOB_THRESHOLD
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
