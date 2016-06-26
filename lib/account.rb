require 'printer'

class Account
  attr_reader :balance, :history, :printer

  def initialize(printer = Printer.new)
    @balance = 0
    @history = []
    @printer  = printer
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
    printer.view_statement(@history)
  end

  private
    def add_transaction(amount, date, type)
      transaction = {date: date, credit: amount, debit: nil, balance: @balance} if type == :deposit
      transaction = {date: date, credit: nil, debit: amount, balance: @balance} if type == :withdraw
      @history << transaction
    end

    def today
      Time.now.strftime("%m/%d/%y")
    end

    def reduce_balance(amount)
      @balance -= amount
    end

    def increase_balance(amount)
      @balance += amount
    end
end
