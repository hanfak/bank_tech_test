class Account

  attr_reader :balance, :history
  HEADER ="date || credit || debit || balance\n"
  def initialize
    @balance = 0
    @history = []
  end

  def credit(amount,date)
    @balance += amount
    add_transaction(amount, date, :deposit)
  end

  def print_statement
     HEADER  +  combined_transactions
  end

  def change amount
    "%.2f" % (amount)
  end

  private

  def add_transaction(amount, date, type)
    transaction = {date: date, credit: amount, debit: nil, balance: @balance} if type == :deposit
    @history << transaction
  end

  def format transaction
    "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
  end

  def combined_transactions
    @history.reverse.inject("") do |statement, transaction|
      statement << (format(transaction) + "\n")
    end.strip
  end


end
