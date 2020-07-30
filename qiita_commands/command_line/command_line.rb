# frozen_string_literal: true

require 'optparse'
require 'qiita_trend'
require './qiita_commands/errors/invalid_option'

module QiitaCommands
  class CLI
    attr_accessor :options

    def initialize
      @options = { target: 'daily' }
      opts = OptionParser.new

      opts.on('-d', '--daily', 'get daily qiita trend')     { @options[:target] = QiitaTrend::TrendType::DAILY }
      opts.on('-w', '--weekly', 'get weekly qiita trend')   { @options[:target] = QiitaTrend::TrendType::WEEKLY }
      opts.on('-m', '--monthly', 'get monthly qiita trend') { @options[:target] = QiitaTrend::TrendType::MONTHLY }

      raise QiitaCommands::InvalidOption, 'Invalid option: Multiple daily and weekly and monthly cannot be specified.' unless valid_args?

      opts.parse!(ARGV)
    rescue OptionParser::InvalidOption => e
      exit_process(e.message)
    rescue QiitaCommands::InvalidOption => e
      exit_process(e.message)
    end

    def has?(name)
      @options.include?(name)
    end

    def get(name)
      return '' unless has?(name)

      @options[name]
    end

    private

    def valid_args?
      # daily, weekly, monthly の指定が複数あった場合は不正と判断する
      return false if ARGV.grep(/\A(-d|-w|-m|--daily|--weekly|--monthly)\z/).length >= 2

      true
    end

    def exit_process(message)
      puts message
      exit 1
    end
  end
end
