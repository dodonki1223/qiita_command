require 'yaml'

module QiitaCommands
  class Config
    attr_reader :user_name, :password, :cache_directory

    def initialize
      config = YAML.load_file('./qiita_commands/config/config.yml').transform_keys(&:to_sym)

      @user_name       = config[:user_name]
      @password        = config[:password]
      @cache_directory = config[:cache_directory]
    end
  end
end
