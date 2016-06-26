class Printer
  def view_statement(history)
    "date || credit || debit || balance\n"  +  combined_transactions(history)
  end

  private

    def combined_transactions(history)
      history.reverse.inject("") do |statement, transaction|
        statement << (stringfy(transaction))
      end.strip
    end

    def stringfy(transaction)
      "#{transaction[:date]} || #{currencify transaction[:credit]} || #{currencify transaction[:debit]} || #{currencify transaction[:balance]}" + "\n"
    end

    def currencify amount
      '%.2f' % amount unless amount.nil?
    end
end
