class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(date, balance, credit = nil,debit = nil)
    @date = date
    @balance = balance
    @credit = credit
    @debit = debit
  end


end
