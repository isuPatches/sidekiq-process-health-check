require 'spec_helper'

feature 'GET /mountable/sidekiq' do
  context 'when the Sidekiq queue is healthy' do
    before do
      expect_any_instance_of(Sidekiq::ProcessHealth::Check).to receive(:number_of_enqueued_jobs).and_return(1)
      expect_any_instance_of(Sidekiq::ProcessHealth::Check).to receive(:number_of_active_processes).and_return(1)
      visit '/mountable/sidekiq'
    end

    it { expect(page).to have_text(I18n.t('ok', message: I18n.t('queue_size', queue_size: 1, job_threshold: 50))) }
    it { expect(page).to have_text(I18n.t('ok', message: I18n.t('process_size', process_size: 1, max_process_size: 1))) }
  end

  context 'when the Sidekiq queue is probably having issues' do
    before do
      expect_any_instance_of(Sidekiq::ProcessHealth::Check).to receive(:number_of_enqueued_jobs).and_return(50)
      expect_any_instance_of(Sidekiq::ProcessHealth::Check).to receive(:number_of_active_processes).and_return(0)
      visit '/mountable/sidekiq'
    end

    it { expect(page).to have_text(I18n.t('warning.too_many_jobs_enqueued', message: I18n.t('queue_size', queue_size: 50, job_threshold: 50))) }
    it { expect(page).to have_text(I18n.t('warning.unexpected_number_of_processes', message: I18n.t('process_size', process_size: 0, max_process_size: 1))) }
  end
end