# frozen_string_literal: true

require 'qiita_trend'

module QiitaCommands
  class Trend
    def initialize(type)
      @type = type
      @target = QiitaTrend::Trend.new(type)
    end

    def daily?
      type == QiitaTrend::TrendType::DAILY
    end

    def weekly?
      type == QiitaTrend::TrendType::WEEKLY
    end

    def monthly?
      type == QiitaTrend::TrendType::MONTHLY
    end

    def items
      target.items.each_with_object([]).with_index { |(item, result), index| result << item_shaping(item, index) }
    end

    def new_items
      target.new_items.each_with_object([]).with_index { |(item, result), index| result << item_shaping(item, index) }
    end

    private

    attr_reader :type, :target

    def item_shaping(item, index)
      prefix         = index.to_s.rjust(2, '0')
      symbolize_item = item.transform_keys(&:to_sym)

      "[#{prefix}] #{symbolize_item[:title]}(#{symbolize_item[:likes_count]}) - #{symbolize_item[:article]}"
    end
  end
end
