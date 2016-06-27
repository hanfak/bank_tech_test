require 'printer'
require 'balance'
require 'transaction'

class Account
  attr_reader :balance, :account_history
#inject transaction class
  def initialize(printer = Printer.new, balance = Balance.new)
    @balance = balance
    @account_history = []
    @printer  = printer
  end

  def credit(amount, date = today)
    balance.increase(amount)
    # add_transaction(amount, date, :deposit)
    # To add
    # credit_account(amount,date)
    @account_history << Transaction.new(date,balance.total,amount,nil)#private
  end

  def debit(amount, date = today)
    balance.reduce(amount)
    # add_transaction(amount, date, :withdraw)
    # To add
    # debit_account(amount,date)
    @account_history << Transaction.new(date,balance.total,nil,amount)#private
  end

  def print_statement
    @printer.view_statement(@account_history)
  end

  private
    def add_transaction(amount, date, type)
      transaction = {date: date,
                    credit: amount,
                    debit: nil,
                    balance: balance.total} if type == :deposit
      transaction = {date: date,
                    credit: nil,
                    debit: amount,
                    balance: balance.total} if type == :withdraw
      @account_history << transaction
      # @account_history << transaction.new.withdraw(amount,date) if type == :withdraw
      # @account_history << transaction.new.deposit(amount,date) if type == :deposit
    end

    def today
      Time.now.strftime("%m/%d/%y")
    end
end
