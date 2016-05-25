require 'account'

describe Account do

  subject(:account) { described_class.new }

# Remove when done
  describe '#initialize' do
    it 'initializes with a balance of zero' do
      expect(account.balance).to eq 0
    end

    it 'initializes with an empty history' do
      expect(account.history).to eq []
    end
  end

  describe '#credit' do
    it 'stores money being credited into bank' do
      account.credit(1000.0, '12/12/12')
      deposit_information = {date: '12/12/12',
        credit: 1000.0,
        debit: nil,
        balance: 1000.0}
        expect(account.history.last).to eq deposit_information
    end

    it 'stores multiple credits' do
      account.credit(2000.0, '12/12/12')
      account.credit(1000.0, '15/12/12')
      deposit_information = {date: '15/12/12',
        credit: 1000.0,
        debit: nil,
        balance: 3000.0}
        expect(account.history.last).to eq deposit_information
    end
  end

  describe '#print_statement' do
    header = "date || credit || debit || balance\n"
    first_deposit = "12/12/12 || 1000.0 ||  || 1000.0"
    second_deposit = "15/12/12 || 2000.0 ||  || 3000.0\n"

    it 'prints out header for statement' do
      expect(account.print_statement).to eq header
    end

    it 'prints a single credit to the account' do
      account.credit(1000.0, '12/12/12')
      expect(account.print_statement).to eq header + first_deposit
    end

    it 'prints a multiple credits to the account' do
      account.credit(1000.0, '12/12/12')
      account.credit(2000.0, '15/12/12')
      expect(account.print_statement).to eq header + second_deposit + first_deposit
    end
  end
end
