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

  it "should increase the balance by £100 after deposit of £100" do
    deposit_object = double("deposit")
    allow(deposit_object).to receive(:amount).and_return("£100")
    bank_account.deposit(deposit_object)
    expect(bank_account.balance).to eq "£100.00"
  end

  it "should return a feedback message if deposit was successful" do
    deposit_object = double("deposit")
    allow(deposit_object).to receive(:amount).and_return("£100")
    expect(bank_account.deposit(deposit_object)).to eq 'Success: You have deposited £100'
  end

  it "should add the deposit to the log" do
    deposit_object = double("deposit")
    allow(deposit_object).to receive(:amount).and_return("£100")
    bank_account.deposit(deposit_object)
    expect(bank_account.log.first[1][:deposit]).to eq 100.0
  end

  it "should add the new balance to the log" do
    deposit_object = double("deposit")
    allow(deposit_object).to receive(:amount).and_return("£100")
    bank_account.deposit(deposit_object)
    expect(bank_account.log.first[1][:balance]).to eq 100.0
  end

end
