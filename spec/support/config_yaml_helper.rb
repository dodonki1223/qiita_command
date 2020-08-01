# frozen_string_literal: true

RSpec.shared_context 'when mocking config.yml' do
  let(:mock_yaml) do
    {
      user_name: 'sample_user_name',
      password: 'sample_password',
      cache_directory: './'
    }
  end

  before do
    config_path = File.expand_path('../../config.yml', __dir__)
    allow(YAML).to receive(:load_file).with(config_path).and_return(mock_yaml)
  end
end
