require 'rails_helper'

RSpec.describe "CurrencyRequestGenerator" do
  describe "range" do 
    let(:params) do 
      { period: "2019-06-01 - 2019-06-05" }
    end 

    it "parses the period input to an array of dates" do 
      expect(CurrencyRequestGenerator.new(params).send(:formatted_dates)).to eq(%w(2019-06-01 2019-06-02 2019-06-03 2019-06-04 2019-06-05))
    end 
  end 
end 