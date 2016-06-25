class Account
  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def credit(amount, date = today)
    increase_balance(amount)
    add_transaction(amount, date, :deposit)
  end

  def debit(amount, date = today)
    reduce_balance(amount)
    add_transaction(amount, date, :withdraw)
  end

  def print_statement
    statement_print
  end

  private
    def add_transaction(amount, date, type)
      transaction = {date: date, credit: currencify(amount), debit: nil, balance: currencify(@balance)} if type == :deposit
      transaction = {date: date, credit: nil, debit: currencify(amount), balance: currencify(@balance)} if type == :withdraw
      @history << transaction
    end

    def stringfy transaction
      "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end

    def currencify amount
      '%.2f' % amount
    end

    def today
      Time.now.strftime("%m/%d/%y")
    end

    def combined_transactions
      @history.reverse.inject("") do |statement, transaction|
        statement << (stringfy(transaction) + "\n")
      end.strip
    end

    def statement_print
      "date || credit || debit || balance\n"  +  combined_transactions
    end

    def reduce_balance(amount)
      @balance -= amount
    end

    def increase_balance(amount)
      @balance += amount
    end
end
