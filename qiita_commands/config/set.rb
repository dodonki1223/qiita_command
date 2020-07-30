require 'qiita_trend'
require './qiita_commands/config/config.rb'

module QiitaCommands
  class ConfigSettings
    def self.perform
      config = QiitaCommands::Config.new

      QiitaTrend.configure do |qiita_config|
        qiita_config.user_name = config.user_name
        qiita_config.password = config.password
      end
    end
  end
end
