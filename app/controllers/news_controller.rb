class NewsController < ApplicationController

  def fetch_news
    response = '::MyalliesBreakingNews::Api::Handlers::NewsInformation'.camelize.constantize.call(news_information: params[:news_information])
    render json: { news: response }, status: :ok
  end
end
