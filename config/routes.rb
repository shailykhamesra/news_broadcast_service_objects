Rails.application.routes.draw do
  get '/news' => 'news#fetch_news'
end
