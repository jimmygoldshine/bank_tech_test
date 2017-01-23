class BankAccount

  def initialize
    @balance = 0
    @log = {}
  end

  def balance
    "£#{'%.2f' % @balance}"
  end

  def statement
    "#{statement_headers}"
  end

  def deposit(deposit_class)
    @balance += deposit_class.amount[1..-1].to_f
    @log["#{Time.now.day}/#{Time.now.month}/#{Time.now.year}"] = {deposit: deposit_class.amount[1..-1].to_f, balance: @balance}
    "Success: You have deposited #{deposit_class.amount}"
  end

  def log
    @log
  end

  private

  def statement_headers
    "  date  || credit || debit || balance \n"
  end

end
