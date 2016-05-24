class Account
  def initialize
    @balance = 0.0
  end

  def print_statement
    "date || credit || debit || balance\n14/01/2012 || || || #{convert_to_money @balance}"
  end

  private
    def convert_to_money(number)
       "%.2f" % (number/1.0)
    end
end
