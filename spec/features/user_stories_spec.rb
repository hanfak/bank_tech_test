describe 'user stories' do
  # As a User,
  # To manage my money,
  # I want money in my account and able to view my balance.
  it 'account has a balance of 0 initially' do
    account = Account.new
    statement = "date || credit || debit || balance\n14/01/2012 || || || 0.00"
    expect(account.print_statement).to eq statement
  end

  # As a User,
  # So that I can add money to my account,
  # I want to be able to deposit my money.
  
end
