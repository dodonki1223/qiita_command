# frozen_string_literal: true

require 'qiita_trend'
require './qiita_commands/config/config'

module QiitaCommands
  class ConfigSettings
    def self.perform
      config = QiitaCommands::Config.new

      QiitaTrend.configure do |qiita_config|
        qiita_config.user_name       = config.user_name
        qiita_config.password        = config.password
        qiita_config.cache_directory = config.cache_directory
      end
    end
  end
end
