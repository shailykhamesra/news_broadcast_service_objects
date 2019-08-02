# frozen_string_literal: true

module AlyNews
  module Api
    module ResponseHandlers
      # response class
      class NewsResponse
        def self.call(response)
          initialized = new(response)
          response.status == 200 ? initialized.success : initialized.error
        end

        attr_reader :model_obj, :response_code

        def initialize(response)
          @response = response
        end

        def success
          {
            body: JSON.parse(@response.body)['Data'],
            status: :ok
          }
        end

        def error
          {
            body: JSON.parse(@response.body),
            status: :unprocessable_entity
          }
        end
      end
    end
  end
end
