module MyalliesBreakingNews
  module Api
    module Modules
      module Requests
        module NewsInformation
          class << self
            include ::MyalliesBreakingNews::Api::Modules::Requests::Constants
            def fetch_news_information
              { url: URL, headers: { 'X-RapidAPI-Host': API_HOST, 'X-RapidAPI-Key': API_KEY } }
            end
          end
        end
      end
    end
  end
end
