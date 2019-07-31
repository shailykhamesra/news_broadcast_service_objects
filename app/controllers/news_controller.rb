class NewsController < ApplicationController

  def index
    response = '::MyalliesBreakingNews::Api::Handlers::NewsInformation'.camelize.constantize.call
    render json: response[:body], status: response[:status]
  end
end
