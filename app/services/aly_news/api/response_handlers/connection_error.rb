# frozen_string_literal: true

module AlyNews
  module Api
    module ResponseHandlers
      # error handles calss
      class ConnectionError
        def self.call(options = {})
          new(options).run
        end

        attr_reader :error

        def initialize(options = {})
          @error = options[:error]
        end

        def run
          {
            body: {
              error: @error
            },
            status: :unprocessable_entity
          }
        end
      end
    end
  end
end
