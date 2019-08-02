# frozen_string_literal: true

module AlyNews
  module Api
    module Modules
      module Requests
        module News
          class << self
            include ::AlyNews::Api::Modules::Requests::Constants
            def fetch_news
              { url: URL, headers: { 'X-RapidAPI-Host': API_HOST, 'X-RapidAPI-Key': API_KEY } }
            end
          end
        end
      end
    end
  end
end
