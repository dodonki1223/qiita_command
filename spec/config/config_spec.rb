require './spec/spec_helper'
require './spec/support/config_yaml_helper.rb'
require './qiita_commands/config/config.rb'

module QiitaCommands
  describe Config do
    describe '#initialise' do
      include_context 'mock config.yml'

      subject(:config) { described_class.new }

      it 'Yamlファイルから取得した値がセットされていること' do
        expect(config.user_name).to eq(mock_yaml[:user_name])
        expect(config.password).to eq(mock_yaml[:password])
        expect(config.cache_directory).to eq(mock_yaml[:cache_directory])
      end
    end
  end
end
