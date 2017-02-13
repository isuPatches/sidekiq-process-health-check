module Sidekiq
  module ProcessHealth
    module Check
      module Controller
        extend ActiveSupport::Concern
        include Sidekiq::ProcessHealth::Check

        def show
          render plain: [process_status, queue_status]
        end

        private
          def process_status
            process_size = number_of_active_processes
            process_size_details = t('process_size', process_size: process_size, max_process_size: expected_number_of_processes)
            if process_size == expected_number_of_processes
              t('ok', message: process_size_details)
            else
              t('warning.unexpected_number_of_processes', message: process_size_details)
            end
          end

          def queue_status
            queue_size = number_of_enqueued_jobs
            queue_size_details = t('queue_size', queue_size: queue_size)
            if queue_size < job_threshold
              t('ok', message: queue_size_details)
            else
              t('warning.too_many_jobs_enqueued', message: queue_size_details)
            end
          end
      end
    end
  end
end