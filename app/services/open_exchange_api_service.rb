require 'uri'
require 'net/http'
require 'json'

class OpenExchangeApiService
    
    def self.get_exchange_rate(country_code:)
        exchange_rates = JSON.parse(_exchange_rates)
        exchange_rates["rates"][country_code]
    end

    private

    def self._exchange_rates
        uri = URI('https://open.exchangerate-api.com/v6/latest')
        Rails.cache.fetch(['https://open.exchangerate-api.com/v6/latest', :exchange_rate], :expires => 1.days) do
            response = Net::HTTP.get_response(uri)
            puts "Response"
            puts response
            response.body
        end
    end
end