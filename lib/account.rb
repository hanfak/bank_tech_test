require 'printer'
require 'balance'

class Account
  attr_reader :balance, :account_history

  def initialize(printer = Printer.new, balance = Balance.new)
    @balance = balance
    @account_history = []
    @printer  = printer
  end

  def credit(amount, date = today)
    balance.increase(amount)
    add_transaction(amount, date, :deposit)
  end

  def debit(amount, date = today)
    balance.reduce(amount)
    add_transaction(amount, date, :withdraw)
  end

  def print_statement
    @printer.view_statement(@account_history)
  end

  private
    def add_transaction(amount, date, type)
      transaction = {date: date, credit: amount, debit: nil, balance: balance.total} if type == :deposit
      transaction = {date: date, credit: nil, debit: amount, balance: balance.total} if type == :withdraw
      @account_history << transaction
    end

    def today
      Time.now.strftime("%m/%d/%y")
    end
end
