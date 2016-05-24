User Story 1 - view balance

As a User,
To manage my money,
I want money in my account and able to view my balance.

Objects           Messages
- User
- money
- account
- balance         - view_balance

Format
date || credit || debit || balance
14/01/2012 || || || 0.00


User Story 2 - add money
As a User,
So that I can add money to my account,
I want to be able to deposit my money.

Objects           Messages
- User
- money
- transaction     - credit(money)
- balance         - view_balance

Format
date || credit || debit || balance
14/01/2012 || 100 || || 100.00

As a User,
So that I can pay with cash,
I want to be able to withdraw money.

As a User,
So that I can track my account,
I want to print a bank statement.
