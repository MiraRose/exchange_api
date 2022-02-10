require 'rails_helper'

RSpec.describe ExchangeController, :type => :controller do
    describe "GET show" do
        context "when getting successfully" do

            currency_code = "USD"
            other_currency_code = "CAD"
            amount = 1.00

            subject { get :show, params: {:id => currency_code, :converted_from => other_currency_code, :converted_to => currency_code, :amount => amount} }

            it "returns 200" do
                subject
                expect(response).to have_http_status(:ok)
            end
        end
    end
end