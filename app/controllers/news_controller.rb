# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    res = '::AlyNews::Api::Handlers::News'.camelize
    response = res.constantize.call
    render json: response[:body], status: response[:status]
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
