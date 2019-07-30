module MyalliesBreakingNews
  module Api
    class NewsInformation
      include ::MyalliesBreakingNews::Api::Modules::Connection
      include ::MyalliesBreakingNews::Api::Modules::Logs
      include ::Api::Modules::Failure

      def self.call(options = {})
        new(options)
      end

      attr_reader :api_response, :news_information

      def initialize(options = {})
        @news_information = options[:news_information]
      end

      def start
        response = response_on(fetch_news_information)
        response_body = JSON.parse(response.body)
        @api_response = response_body['Data']
        @api_response
      rescue Faraday::ConnectionFailed, Faraday::TimeoutError, Faraday::SSLError => e
        failure!
        failed?
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

      def fetch_news_information
        ::MyalliesBreakingNews::Api::Modules::Requests::NewsInformation.fetch_news_information
      end
    end
  end
end
