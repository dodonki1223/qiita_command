# frozen_string_literal: true

module QiitaCommands
  class ConfigNotExistsError < StandardError
    def message
      "Not exists `config.yml`. \nPlease create config.yml file."
    end
  end
end
