class NewsController < ApplicationController

  def index
    response = '::MyalliesBreakingNews::Api::Handlers::NewsInformation'.camelize.constantize.call
    render json: response[:body], status: response[:status]
  rescue => e
    render json: {error: e.message}, status: :unprocessable_entity
  end
end
