class Account
  attr_reader :balance, :history

  HEADER = "date || credit || debit || balance\n"

  def initialize
    @balance = 0
    @history = []
  end

  def credit(amount, date)
    increase_balance(amount)
    add_transaction(amount, date, :deposit)
  end

  def debit(amount, date)
    reduce_balance(amount)
    add_transaction(amount, date, :withdraw)
  end

  def print_statement
     HEADER  +  combined_transactions
  end

  private

    def add_transaction(amount, date, type)
      transaction = {date: date, credit: amount, debit: nil, balance: @balance} if type == :deposit
      transaction = {date: date, credit: nil, debit: amount, balance: @balance} if type == :withdraw
      @history << transaction
    end

    def stringfy transaction
      "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
      # string =""
      # transaction.each do |key,value|
      #   string << ("#{key[value]} " + "||")
      # end
      # string.chomp("||")
    end

    def combined_transactions
      @history.reverse.inject("") do |statement, transaction|
        statement << (stringfy(transaction) + "\n")
      end.strip
    end

    def reduce_balance(amount)
      @balance -= amount
    end

    def increase_balance(amount)
      @balance += amount
    end
end
