# frozen_string_literal: true

module AlyNews
  module Api
    module Handlers
      # hnadler for news information
      class News
        def self.call(options = {})
          new(options).run
        end

        attr_reader :news

        def initialize(options = {})
          @news = options[:news]
        end

        def run
          fetch_news.start
        end

        private

        def fetch_news
          @fetch_news ||= ::AlyNews::Api::News.call(news: news)
        end
      end
    end
  end
end
