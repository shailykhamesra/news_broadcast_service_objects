# frozen_string_literal: true

module AlyNews
  module Api
    module Modules
      # faraday connection
      module Connection
        include ::AlyNews::Api::Modules::Requests::News
        include ::AlyNews::Api::Modules::Requests::Constants

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
