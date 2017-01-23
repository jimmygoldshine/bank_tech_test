require 'spec_helper'
require 'deposit'

describe Deposit do

  let(:deposit) { described_class.new(100) }

  it "should have a deposit amount of £100" do
    expect(deposit.amount).to eq ("£100")
  end


end
