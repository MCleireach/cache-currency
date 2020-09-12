class CurrencyRequestGenerator
  attr_accessor :period, :base
  BASE_URL = "http://data.fixer.io/api/".freeze
  API_KEY = Rails.application.credentials.fixer[:api_key].freeze

  def initialize(params)
    @period = params[:period]
    @base = params[:base]
  end 

  def fetch_or_create
    responses = []
    formatted_dates.each do |date| 
      if existing_request = FixerRequest.find_by(date: date, base: base)
        responses << existing_request
      else 
        response = call_fixer(date).response_body
        responses << FixerRequest.create(date: date, base: base, response: response)
      end
    end
    responses
  end

  private

  def call_fixer(date)
    Typhoeus::Request.new(
      "#{BASE_URL}/#{date}",
      method: :post,
      params: { 
        access_key: API_KEY,
        base: base,
      },
    ).run
  end

  def formatted_dates
    range = (parse_date_string(period.split(" - ")[0])..parse_date_string( period.split(" - ")[1]))
    range.map{ |dateTime| dateTime.strftime("%Y-%M-%d") }
  end 

  def parse_date_string(string)
    DateTime.strptime(string, "%Y-%M-%d")
  end
end 