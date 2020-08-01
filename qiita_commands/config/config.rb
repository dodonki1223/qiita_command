# frozen_string_literal: true

require 'yaml'
require_relative './config'
require_relative '../errors/config_error'

module QiitaCommands
  class Config
    attr_reader :user_name, :password, :cache_directory

    def initialize
      config_path = File.expand_path('../../config.yml', __dir__)
      config = YAML.load_file(config_path).transform_keys(&:to_sym)

      @user_name       = config[:user_name]
      @password        = config[:password]
      @cache_directory = config[:cache_directory]
    rescue Errno::ENOENT
      raise ConfigNotExistsError
    end
  end
end
