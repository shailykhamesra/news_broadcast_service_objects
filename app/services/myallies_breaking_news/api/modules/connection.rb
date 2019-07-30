module MyalliesBreakingNews
  module Api
    module Modules
      module Connection

        include ::MyalliesBreakingNews::Api::Modules::Requests::NewsInformation
        include ::MyalliesBreakingNews::Api::Modules::Requests::Constants

        private

        def connection
          @connection = Faraday.new(url: URL) do |faraday|
            faraday.headers['Content-Type'] = 'application/json'
            faraday.adapter Faraday.default_adapter
          end
        end
      end
    end
  end
end
