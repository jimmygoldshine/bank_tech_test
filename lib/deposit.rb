class Deposit

  def initialize(amount)
    @amount = amount
  end

  def amount
    "£#{@amount}"
  end

end
