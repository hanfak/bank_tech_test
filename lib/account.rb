class Account

  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def store_transactions
    add_header
  end

  def print_statement
    @history.inject("") do |statement, transaction|
      statement << (transaction + "\n")
    end
  end

  private

    def add_header
      @history<<"date || credit || debit || balance"
    end
end
