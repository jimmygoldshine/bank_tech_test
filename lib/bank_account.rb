class BankAccount

  def initialize
    @balance = 0
    @log = {}
    @transaction_index = 1
  end

  def balance
    "£#{'%.2f' % @balance}"
  end

  def statement
    puts "#{statement_headers}"
    @log.each_pair do |index,record|
      puts "   #{record[:date].day}/#{record[:date].month}/#{record[:date].year}  ||#{formatting(record[:deposit].to_s)}||#{formatting(record[:withdrawal].to_s)}||#{formatting(record[:balance].to_s)}||"
    end
  end

  def deposit(deposit_class)
    @balance += deposit_class.amount[1..-1].to_f
    @log[@transaction_index] = {date: Time.now, deposit: deposit_class.amount[1..-1].to_f, balance: @balance}
    @transaction_index += 1
    "Success: You have deposited #{deposit_class.amount}"
  end

  def withdrawal(withdrawal_class)
    if (@balance - withdrawal_class.amount[1..-1].to_f) < 0
      raise "Error: You don't have sufficient funds to withdraw #{withdrawal_class.amount}"
    else
      @balance -= withdrawal_class.amount[1..-1].to_f
      @log[@transaction_index] = {date: Time.now, withdrawal: withdrawal_class.amount[1..-1].to_f, balance: @balance}
      @transaction_index += 1
      "Success: You have withdrawn #{withdrawal_class.amount}"
    end
  end

  def log
    @log
  end

  private

  def statement_headers
    "     date     ||    credit    ||     debit    ||    balance   ||"
  end

  def formatting(string)
    if string == ""
      " "*14
    else
      margins = 14 - string.length
      if margins % 2 != 0
        left_margin = ((margins / 2) + 1).round - 1
      else
        left_margin = (margins / 2) - 1
      end
      right_margin = (margins / 2) - 1
      " "*left_margin + "£#{'%.2f' % string.to_f}" + " "*right_margin
    end
  end

  def enough_funds?
  end

end
