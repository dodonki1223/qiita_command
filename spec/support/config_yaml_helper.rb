# frozen_string_literal: true

RSpec.shared_context 'when not exists config.yml' do
  before { allow(YAML).to receive(:load_file).with(File.expand_path('../../config.yml', __dir__)).and_raise(Errno::ENOENT) }
end

RSpec.shared_context 'when mocking config.yml' do
  let(:mock_yaml) do
    {
      user_name: 'sample_user_name',
      password: 'sample_password',
      cache_directory: './'
    }
  end

  before { allow(YAML).to receive(:load_file).with(File.expand_path('../../config.yml', __dir__)).and_return(mock_yaml) }
end
