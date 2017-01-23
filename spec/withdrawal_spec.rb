require 'spec_helper'
require 'withdrawal'

describe Withdrawal do

  let(:withdrawal) { described_class.new(500) }

  it "should return an amount of £500 when initialized with £500" do
    expect(withdrawal.amount).to eq "£500"
  end

end
