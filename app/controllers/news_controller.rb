class NewsController < ApplicationController

  def index
    response = '::MyalliesBreakingNews::Api::Handlers::NewsInformation'.camelize.constantize.call(news_information: params[:news_information])
    render json: { news: response }, status: :ok
  end
end
