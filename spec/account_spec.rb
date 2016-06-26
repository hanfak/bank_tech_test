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
                            credit: 1000.0,
                            debit: nil,
                            balance: 1000.0}
      expect(account.history.last).to eq deposit_information
    end

    it 'stores multiple' do
      account.credit(2000, '12/12/12')
      account.credit(1000, '15/12/12')
      deposit_information = {date: '15/12/12',
                            credit: 1000.0,
                            debit: nil,
                            balance: 3000.0}
      expect(account.history.last).to eq deposit_information
    end

    it 'with today\'s date' do
      account.credit(2000)
      deposit_information = {date: TODAY,
                            credit: 2000.0,
                            debit: nil,
                            balance: 2000.0}
      expect(account.history.last).to eq deposit_information
    end
  end

  describe '#debit' do
    it 'stores one' do
      account.debit(500, '14/12/12')
      deposit_information = {date: '14/12/12',
        credit: nil,
        debit: 500.0,
        balance: -500.0}
      expect(account.history.last).to eq deposit_information
    end

    it 'stores multiple' do
      account.debit(500, '12/12/12')
      account.debit(1000, '15/12/12')
      deposit_information = {date: '15/12/12',
        credit: nil,
        debit: 1000.0,
        balance: -1500.0}
      expect(account.history.last).to eq deposit_information
    end

    it 'with today\'s date' do
      account.debit(2000)
      deposit_information = {date: TODAY,
                            credit: nil,
                            debit: 2000.0,
                            balance: -2000.0}
      expect(account.history.last).to eq deposit_information
    end
  end

  describe '#print_statement' do
    it 'prints a statement of the account' do
      expected_statement = "date || credit || debit || balance\n14/01/12 ||  || 1500.00 || 2500.00\n13/01/12 || 2000.00 ||  || 4000.00\n10/01/12 || 2000.00 ||  || 2000.00"

      account.credit(2000, '10/01/12')
      account.credit(2000, '13/01/12')
      account.debit(1500, '14/01/12')
      expect(account.print_statement).to eq expected_statement
    end
  end
end
