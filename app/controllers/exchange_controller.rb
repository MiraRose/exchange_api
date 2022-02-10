class ExchangeController < ApplicationController
    def show
        converted_to = params.require(:id)
        converted_from = params.require(:converted_from)
        amount = params.require(:amount)

        new_amount = ConversionService.convert(:convert_from => converted_from, :convert_to => converted_to, :amount => amount)
        render json: {:new_amount => new_amount}, status: :ok
    end
end