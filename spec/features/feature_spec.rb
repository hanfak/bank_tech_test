describe 'feature test' do
  header = "date || credit || debit || balance\n"
  first_deposit = "10/01/12 || 1000.0 ||  || 1000.0"
  second_deposit = "13/01/12 || 2000.0 ||  || 3000.0\n"

  it 'prints multiple transactions' do
    account = Account.new
    account.credit(1000.0, '10/01/12')
    account.credit(2000.0, '13/01/12')
    expect(account.print_statement).to eq header + second_deposit + first_deposit
  end
end
