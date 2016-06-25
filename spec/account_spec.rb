require 'account'

describe Account do
  TODAY =Time.now.strftime("%m/%d/%y")

  subject(:account) { described_class.new }

# Remove when done
  describe '#initialize' do
    it 'balance of zero' do
      expect(account.balance).to eq 0
    end

    it 'empty history' do
      expect(account.history).to eq []
    end
  end

  describe '#credit' do
    it 'stores one' do
      account.credit(1000, '12/12/12')
      deposit_information = {date: '12/12/12',
                            credit: '1000.00',
                            debit: nil,
                            balance: '1000.00'}
      expect(account.history.last).to eq deposit_information
    end

    it 'stores multiple' do
      account.credit(2000, '12/12/12')
      account.credit(1000, '15/12/12')
      deposit_information = {date: '15/12/12',
                            credit: '1000.00',
                            debit: nil,
                            balance: '3000.00'}
      expect(account.history.last).to eq deposit_information
    end

    it 'with today\'s date' do
      account.credit(2000)
      deposit_information = {date: TODAY,
                            credit: '2000.00',
                            debit: nil,
                            balance: '2000.00'}
      expect(account.history.last).to eq deposit_information
    end
  end

  describe '#debit' do
    it 'stores one' do
      account.debit(500, '14/12/12')
      deposit_information = {date: '14/12/12',
        credit: nil,
        debit: '500.00',
        balance: '-500.00'}
      expect(account.history.last).to eq deposit_information
    end

    it 'stores multiple' do
      account.debit(500, '12/12/12')
      account.debit(1000, '15/12/12')
      deposit_information = {date: '15/12/12',
        credit: nil,
        debit: '1000.00',
        balance: '-1500.00'}
      expect(account.history.last).to eq deposit_information
    end

    it 'with today\'s date' do
      account.debit(2000)
      deposit_information = {date: TODAY,
                            credit: nil,
                            debit: '2000.00',
                            balance: '-2000.00'}
      expect(account.history.last).to eq deposit_information
    end
  end

  describe '#print_statement' do
    header = "date || credit || debit || balance\n"
    first_deposit = "12/12/12 || 1000.00 ||  || 1000.00"
    second_deposit = "15/12/12 || 2000.00 ||  || 3000.00\n"
    first_withdrawal = "14/01/12 ||  || 500.00 || -500.00"

    it 'prints out header for statement' do
      expect(account.print_statement).to eq header
    end

    it 'prints a single credit to the account' do
      account.credit(1000, '12/12/12')
      expect(account.print_statement).to eq header + first_deposit
    end

    it 'prints a multiple credits to the account' do
      account.credit(1000, '12/12/12')
      account.credit(2000, '15/12/12')
      expect(account.print_statement).to eq header + second_deposit + first_deposit
    end

    it 'prints a single debit to the account' do
      account.debit(500, '14/01/12')
      expect(account.print_statement).to eq header + first_withdrawal
    end
  end
end
