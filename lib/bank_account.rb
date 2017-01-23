class BankAccount

  def initialize
    @balance = 0
  end

  def balance
    "£#{'%.2f' % @balance}"
  end

  def statement
    "#{statement_headers}"
  end

  private

  def statement_headers
    "  date  || credit || debit || balance \n"
  end

end
