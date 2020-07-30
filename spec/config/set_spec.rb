# frozen_string_literal: true

require 'qiita_trend'
require './spec/spec_helper'
require './qiita_commands/config/set'

module QiitaCommands
  describe ConfigSettings do
    describe '.perform' do
      let(:qiita_trend_config) { QiitaTrend.configuration }

      include_context 'mock config.yml'

      subject { described_class.perform }

      before { subject }

      it 'qiita_trendにYamlファイルの内容が設定されていること' do
        expect(qiita_trend_config.user_name).to eq(mock_yaml[:user_name])
        expect(qiita_trend_config.password).to eq(mock_yaml[:password])
        expect(qiita_trend_config.cache_directory).to eq(mock_yaml[:cache_directory])
      end
    end
  end
end
