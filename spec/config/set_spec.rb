# frozen_string_literal: true

require 'qiita_trend'
require './spec/spec_helper'
require './qiita_commands/config/set'

module QiitaCommands
  describe ConfigSettings do
    describe '.perform' do
      context 'when not exists config.yml' do
        include_context 'when not exists config.yml'
        include_context 'when disable standard output'
        let(:qiita_trend_config) { QiitaTrend.configuration }

        it { expect { described_class.perform }.to raise_error(SystemExit) }
      end

      context 'when exists config.yml' do
        include_context 'when mocking config.yml'
        let(:qiita_trend_config) { QiitaTrend.configuration }

        before { described_class.perform }

        it 'qiita_trendにYamlファイルの内容が設定されていること' do
          expect(qiita_trend_config.user_name).to eq(mock_yaml[:user_name])
          expect(qiita_trend_config.password).to eq(mock_yaml[:password])
          expect(qiita_trend_config.cache_directory).to eq(mock_yaml[:cache_directory])
        end
      end
    end
  end
end
