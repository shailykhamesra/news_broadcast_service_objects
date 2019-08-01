module AlyNews
  module Api
    module Modules
      # logs for connection error
      module Logs
        private

        def connection_failed_log(e)
          Rails.logger.error("\n\n==== [NewsBroadcast] [#{Time.now}] Crash happend in class: #{e.class.name} | Message: #{e.message} \n\n Backtrace: #{e.backtrace.join("\n")}\n\n")
        end
      end
    end
  end
end
