class ConversionService

    def self.convert(convert_from:, convert_to:, amount:)
        if convert_from == "USD"
            exchange_rate = OpenExchangeApiService.get_exchange_rate(:country_code => convert_to)
            return amount / exchange_rate 
        elsif convert_to == "USD"
            exchange_rate = OpenExchangeApiService.get_exchange_rate(:country_code => convert_from)
            return amount * exchange_rate
        else
            from_exchange_rate = OpenExchangeApiService.get_exchange_rate(:country_code => convert_to)
            to_exchange_rate = OpenExchangeApiService.get_exchange_rate(:country_code => convert_from)
            amount = amount * to_exchange_rate
            return (amount / from_exchange_rate).round(2)
        end
    end
end