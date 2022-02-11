class ConversionService

    def self.convert(convert_from:, convert_to:, amount:)
        amount_in_cents = amount.to_f * 100
        if convert_from == "USD"
            exchange_rate = OpenExchangeApiService.get_exchange_rate(:country_code => convert_to)
            return ((amount_in_cents / exchange_rate) / 100).round(2)
        elsif convert_to == "USD"
            exchange_rate = OpenExchangeApiService.get_exchange_rate(:country_code => convert_from)
            return ((amount_in_cents * exchange_rate) / 100).round(2)
        else
            from_exchange_rate = OpenExchangeApiService.get_exchange_rate(:country_code => convert_to)
            to_exchange_rate = OpenExchangeApiService.get_exchange_rate(:country_code => convert_from)
            amount_in_cents = amount_in_cents * to_exchange_rate
            return ((amount_in_cents / from_exchange_rate) / 100).round(2)
        end
    end
end