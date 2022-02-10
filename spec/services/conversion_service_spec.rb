require 'rails_helper'
require 'money'

RSpec.describe ConversionService do
    describe ".convert" do
        
        before do
            allow(OpenExchangeApiService).to receive(:get_exchange_rate).with(:country_code => "CAD").and_return(1.25)
            allow(OpenExchangeApiService).to receive(:get_exchange_rate).with(:country_code => "USD").and_return(1.00)
            allow(OpenExchangeApiService).to receive(:get_exchange_rate).with(:country_code => "YEN").and_return(0.0086)
            allow(OpenExchangeApiService).to receive(:get_exchange_rate).with(:country_code => "EUR").and_return(1.14)
        end

        subject {ConversionService.convert(:convert_from => convert_from, :convert_to => convert_to, :amount => amount)}

        let(:convert_to) { "CAD" }
        let(:convert_from) { "USD" }
        let(:amount) { "100.00" }

        context "when converting from USD to another currency" do
            it "returns the right value" do
                expect(subject).to eq(80.00)
            end
        end

        context "when converting from non-USD to USD" do
            let(:convert_to) { "USD" }
            let(:convert_from) { "CAD" }
            let(:amount) { "80.00" }

            it "returns the right value" do
                expect(subject).to eq(100.00)
            end
        end

        context "when converting from non-USD to non-USD" do
            let(:convert_to) { "EUR" }
            let(:convert_from) { "YEN" }
            let(:amount) { "100.00" }

            it "returns the right value" do
                expect(subject).to eq(0.75)
            end
        end
        
    end
end