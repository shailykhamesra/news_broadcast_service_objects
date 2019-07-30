module MyalliesBreakingNews
  module Api
    module ResponseHandlers
      class ConnectionError
        def self.call(options = {})
          new(options).error
        end

        attr_reader :model_obj

        def initialize(options = {})
          @model_obj = options[:model_obj]
        end

        def error
          model_obj.fail!
          model_obj
        end
      end
    end
  end
end
