# frozen_string_literal: true

RSpec.shared_context 'mock config.yml' do
  let(:mock_yaml) do
    {
      user_name: 'sample_user_name',
      password: 'sample_password',
      cache_directory: './'
    }
  end

  before do
    allow(YAML).to receive(:load_file).with('./qiita_commands/config/config.yml').and_return(mock_yaml)
  end
end
