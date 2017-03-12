describe '#configure' do

  context 'with configuration' do
    before :each do
      Sidekiq::ProcessHealth::Check.configure do |config|
        config.expected_number_of_processes = 4
        config.job_threshold = 10
      end
    end

    it 'returns an array with 10 elements' do
      configuration = Sidekiq::ProcessHealth::Check.configuration

      expect(configuration.expected_number_of_processes).to eq(4)
      expect(configuration.job_threshold).to eq(10)
    end

    after :each do
      Sidekiq::ProcessHealth::Check.reset
    end
  end

  context 'without configuration' do
    it 'returns an array with 10 elements' do
      configuration = Sidekiq::ProcessHealth::Check.configuration

      expect(configuration.expected_number_of_processes).to eq(Sidekiq::ProcessHealth::Check::Configuration::DEFAULT_EXPECTED_PROCESS_NUMBER)
      expect(configuration.job_threshold).to eq(Sidekiq::ProcessHealth::Check::Configuration::DEFAULT_JOB_THRESHOLD)
    end
  end
end