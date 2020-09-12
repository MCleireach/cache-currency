module JsonResponseSerializer 
  class << self

    def get_requested_currency(json_responses, currency) 
      json_responses.map do |json_response|
        response = JSON.parse(json_response)
        {
          date: response["date"],
          base: response["base"],
          other_currency: currency,
          rate: response["rates"][currency.to_s]
        }
      end 
    end 
  end
end 
