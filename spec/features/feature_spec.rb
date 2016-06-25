describe 'feature test' do
  header = "date || credit || debit || balance\n"
  first_deposit = "10/01/12 || 1000.00 ||  || 1000.00"
  second_deposit = "13/01/12 || 2000.00 ||  || 3000.00\n"
  first_withdrawal = "14/01/12 ||  || 500.00 || 2500.00\n"

  it 'prints multiple transactions' do
    account = Account.new
    account.credit(1000, '10/01/12')
    account.credit(2000, '13/01/12')
    account.debit(500, '14/01/12')
    expect(account.print_statement).to eq header + first_withdrawal + second_deposit + first_deposit
  end
end
