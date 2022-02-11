require 'rails_helper'

RSpec.describe ExchangeController, :type => :controller do
    describe "GET show" do
        context "when getting successfully" do

            currency_code = "USD"
            other_currency_code = "CAD"
            amount = 1.00

            subject { get :show, params: {:id => currency_code, :converted_from => other_currency_code, :converted_to => currency_code, :amount => amount} }

            before do
                allow(ConversionService).to receive(:convert).and_return(1.27)
            end

            it "returns 200" do
                subject
                expect(response).to have_http_status(:ok)
            end

            it "has a response body with new_amount" do
                subject
                body = JSON.parse(response.body)
                expect(body).to have_key("new_amount")
            end
        end
    end
end
