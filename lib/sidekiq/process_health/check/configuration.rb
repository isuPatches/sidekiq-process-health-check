module Sidekiq
  module ProcessHealth
    module Check
      class Configuration
        DEFAULT_EXPECTED_PROCESS_NUMBER = 1

        DEFAULT_JOB_THRESHOLD = 50

        attr_accessor :expected_number_of_processes, :job_threshold

        def initialize
          @expected_number_of_processes = DEFAULT_EXPECTED_PROCESS_NUMBER
          @job_threshold = DEFAULT_JOB_THRESHOLD
        end
      end
    end
  end
end