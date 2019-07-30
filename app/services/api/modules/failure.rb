module Api
  module Modules
    module Failure
      def failure!
        @failure = true
      end

      def failed?
        @failure
      end
    end
  end
end
