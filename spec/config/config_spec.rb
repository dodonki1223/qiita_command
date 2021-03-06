# frozen_string_literal: true

require './spec/spec_helper'
require './qiita_commands/config/config'

module QiitaCommands
  describe Config do
    describe '#initialise' do
      subject(:config) { described_class.new }

      context 'when not exists config.yml' do
        include_context 'when not exists config.yml'

        it { expect { config }.to raise_error(QiitaCommands::ConfigNotExistsError) }
      end

      context 'when exists config.yml' do
        include_context 'when mocking config.yml'

        it 'Yamlファイルから取得した値がセットされていること' do
          expect(config.user_name).to eq(mock_yaml[:user_name])
          expect(config.password).to eq(mock_yaml[:password])
          expect(config.cache_directory).to eq(mock_yaml[:cache_directory])
        end
      end
    end
  end
end
