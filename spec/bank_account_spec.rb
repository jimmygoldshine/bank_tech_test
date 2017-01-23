require 'spec_helper'
require 'bank_account'

describe BankAccount do

  let(:bank_account) { described_class.new }

  it "should be initialized with a default balance of £0.00" do
    expect(bank_account.balance).to eq "£0.00"
  end

  it "should be initialized with an empty bank statement" do
    expect(bank_account.statement).to eq "  date  || credit || debit || balance \n"
  end


end
