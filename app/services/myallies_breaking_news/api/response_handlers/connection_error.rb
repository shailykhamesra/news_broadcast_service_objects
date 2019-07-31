module MyalliesBreakingNews
  module Api
    module ResponseHandlers
      class ConnectionError

        def self.call(options = {})
          new(options).error
        end

        attr_reader :error

        def initialize(options = {})
          @error = options[:error]
        end

        def error
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
