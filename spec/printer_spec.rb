require 'printer'

describe Printer do
  subject(:printer) { described_class.new }

  header = "date || credit || debit || balance\n"
  first_deposit = "12/12/12 || 1000.00 ||  || 1000.00"
  second_deposit = "15/12/12 || 2000.00 ||  || 3000.00\n"
  first_withdrawal = "14/01/12 ||  || 500.00 || -500.00"

  it 'prints out header for statement' do
    empty_history = []
    expect(printer.view_statement(empty_history)).to eq header
  end

  it 'prints a single credit to the account' do
    history = [{date: '12/12/12',
                credit: 1000.0,
                debit: nil,
                balance: 1000.0}]
    expect(printer.view_statement(history)).to eq header + first_deposit
  end

  it 'prints a multiple credits to the account' do
    history = [{date: '12/12/12',
                credit: 1000.0,
                debit: nil,
                balance: 1000.0},
                {date: '15/12/12',
                credit: 2000.00,
                debit: nil,
                balance: 3000.0}]
    expect(printer.view_statement(history)).to eq header + second_deposit + first_deposit
  end

  it 'prints a single debit to the account' do
    history = [{date: '14/01/12',
                credit: nil,
                debit: 500.0,
                balance: -500.00}]
    expect(printer.view_statement(history)).to eq header + first_withdrawal
  end
end
