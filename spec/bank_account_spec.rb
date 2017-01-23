require 'spec_helper'
require 'bank_account'

describe BankAccount do

  let(:bank_account) { described_class.new }

  it "should be initialized with a default balance of £0.00" do
    expect(bank_account.balance).to eq "£0.00"
  end

  context "depositing funds" do

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
      expect(bank_account.log[1][:deposit]).to eq 100.0
    end

    it "should add the new balance to the log" do
      deposit_object = double("deposit")
      allow(deposit_object).to receive(:amount).and_return("£100")
      bank_account.deposit(deposit_object)
      expect(bank_account.log[1][:balance]).to eq 100.0
    end
  end

  context "withdrawals" do

    it "should return an error message if not enough funds to withdraw" do
      withdrawal_object = double("withdrawal")
      allow(withdrawal_object).to receive(:amount).and_return("£500")
      expect{(bank_account.withdrawal(withdrawal_object))}.to raise_error "Error: You don't have sufficient funds to withdraw £500"
    end

    it "should return a feedback message if the withdrawal was successful" do
      deposit_object = double("deposit")
      allow(deposit_object).to receive(:amount).and_return("£100")
      withdrawal_object = double("withdrawal")
      allow(withdrawal_object).to receive(:amount).and_return("£50")
      bank_account.deposit(deposit_object)
      expect(bank_account.withdrawal(withdrawal_object)).to eq "Success: You have withdrawn £50"
    end

    it "should have a balance of £50 after withdrawing £50 from £100" do
      deposit_object = double("deposit")
      allow(deposit_object).to receive(:amount).and_return("£100")
      withdrawal_object = double("withdrawal")
      allow(withdrawal_object).to receive(:amount).and_return("£50")
      bank_account.deposit(deposit_object)
      bank_account.withdrawal(withdrawal_object)
      expect(bank_account.balance).to eq "£50.00"
    end

    it "should add the withdrawal to the log" do
      deposit_object = double("deposit")
      allow(deposit_object).to receive(:amount).and_return("£100")
      withdrawal_object = double("withdrawal")
      allow(withdrawal_object).to receive(:amount).and_return("£50")
      bank_account.deposit(deposit_object)
      bank_account.withdrawal(withdrawal_object)
      expect(bank_account.log.size).to eq 2
    end

    it "should store the new balance" do
      deposit_object = double("deposit")
      allow(deposit_object).to receive(:amount).and_return("£100")
      withdrawal_object = double("withdrawal")
      allow(withdrawal_object).to receive(:amount).and_return("£50")
      bank_account.deposit(deposit_object)
      bank_account.withdrawal(withdrawal_object)
      expect(bank_account.log[2][:balance]).to eq 50.0
    end

    it "should store the withdrawal amount" do
      deposit_object = double("deposit")
      allow(deposit_object).to receive(:amount).and_return("£100")
      withdrawal_object = double("withdrawal")
      allow(withdrawal_object).to receive(:amount).and_return("£50")
      bank_account.deposit(deposit_object)
      bank_account.withdrawal(withdrawal_object)
      expect(bank_account.log[2][:withdrawal]).to eq 50.0
    end
  end
end
