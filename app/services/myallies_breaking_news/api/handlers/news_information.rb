module MyalliesBreakingNews
  module Api
    module Handlers
      class NewsInformation
        def self.call(options = {})
          new(options).run
        end

        attr_reader :news_information

        def initialize(options = {})
          @news_information = options[:news_information]
        end

        def run
          fetch_news_information.start
        end

        private

        def fetch_news_information
          @fetch_news_information ||= ::MyalliesBreakingNews::Api::NewsInformation.call(news_information: news_information)
        end
      end
    end
  end
end
