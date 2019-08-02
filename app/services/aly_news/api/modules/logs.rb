# frozen_string_literal: true

module AlyNews
  module Api
    module Modules
      # logs for connection error
      module Logs
        private

        def connection_failed_log(error)
          Rails.logger.error("\n\n==== [NewsBroadcast] [#{Time.now}] Crash happend in class: #{error.class.name} | Message: #{error.message} \n\n Backtrace: #{error.backtrace.join("\n")}\n\n")
        end
      end
    end
  end
end
