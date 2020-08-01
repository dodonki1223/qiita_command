# frozen_string_literal: true

require 'qiita_trend'
require 'highline/import'
require_relative './config'
require_relative '../errors/config_error'

module QiitaCommands
  class ConfigSettings
    def self.perform
      config = QiitaCommands::Config.new

      QiitaTrend.configure do |qiita_config|
        qiita_config.user_name       = config.user_name
        qiita_config.password        = config.password
        qiita_config.cache_directory = config.cache_directory
      end
    rescue ConfigNotExistsError => e
      highline = HighLine.new
      puts highline.color(e.message, :red)
      exit 1
    end
  end
end
