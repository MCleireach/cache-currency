class FixerRequestsController < ApplicationController
  include JsonResponseSerializer

  def create
    fixer_requests = CurrencyRequestGenerator.new(params).fetch_or_create
    all_currencies_json = fixer_requests.pluck(:response)

    render json: JsonResponseSerializer.get_requested_currency(all_currencies_json, params[:other_currency])
  end
end
