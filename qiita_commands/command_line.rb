# frozen_string_literal: true

require 'optparse'
require 'qiita_trend'
require 'highline/import'
require_relative './errors/invalid_option'

module QiitaCommands
  class CLI
    attr_accessor :options

    def initialize
      @options = { target: 'normal', new: false }
      opts = OptionParser.new

      opts.on('-n', '--normal', 'get normal qiita trend')     { @options[:target] = QiitaTrend::TrendType::NORMAL }
      opts.on('-p', '--personal', 'get personal qiita trend') { @options[:target] = QiitaTrend::TrendType::PERSONAL }
      opts.on('--new', 'get qiita trend for new article')     { |v| @options[:new] = v }

      raise QiitaCommands::InvalidOption, 'Invalid option: Multiple normal and personal cannot be specified.' unless valid_args?

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
      # normal, personal の指定が複数あった場合は不正と判断する
      return false if ARGV.grep(/\A(-n|-p|--normal|--personal|)\z/).length >= 2

      true
    end

    def exit_process(message)
      highline = HighLine.new
      puts highline.color(message, :red)
      exit 1
    end
  end
end
