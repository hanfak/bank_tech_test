objcts
- transaction
  -  deposit(amount, date)
  - withdraw(amount, date)
- transactions
  - list
  - add(transaction)
- balance
  - increase_by(amount)
  - decrease_by(amount)
  - balance
- print???
  - stringfy
  - print_statement

capture decimal
/(\d*\.\d+)/
sub .00

account
  - view credit

implementation
--------------

account = Account.new
transaction.new(1000, '10/01/12', :deposit )
transaction.new(500, '10/01/12', :withdraw )
account.view_statement
Printer.print_statement
