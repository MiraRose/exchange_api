require 'uri'
require 'net/http'

class OpenExchangeApiService
    
    def self.get_exchange_rate(country_code:)
        _exchange_rates["rates"][country_code]
    end

    private

    def self._exchange_rates
        uri = URI('https://open.exchangerate-api.com/v6/latest')
        Rails.cache.fetch("/exchange_rates", :expires => 1.days) do
            Net::HTTP.get_response(uri)
        end
    end
end