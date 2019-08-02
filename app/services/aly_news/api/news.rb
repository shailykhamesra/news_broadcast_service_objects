# frozen_string_literal: true

module AlyNews
  module Api
    # News inofrmation fetching
    class News
      include ::AlyNews::Api::Modules::Connection
      include ::AlyNews::Api::Modules::Logs

      def self.call(options = {})
        new(options)
      end

      attr_reader :api_response, :news

      def initialize(options = {})
        @news = options[:news]
      end

      def start
        api_response = response_on(fetch_news)
        ::AlyNews::Api::ResponseHandlers::NewsResponse.call(api_response)
      rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
        connection_failed_log(e)
        ::AlyNews::Api::ResponseHandlers::ConnectionError.call(error: e.message)
      end

      private

      def response_on(request)
        connection.get do |req|
          req.url  request[:url]
          req.headers = request[:headers]
          req.headers['Content-Type'] = 'application/json'
          req.body = request[:body]
        end
      end

      def fetch_news
        ::AlyNews::Api::Modules::Requests::News.fetch_news
      end
    end
  end
end
