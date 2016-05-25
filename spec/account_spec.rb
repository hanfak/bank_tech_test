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

  describe '#store_transactions' do
    it 'stores the header' do
      header = "date || credit || debit || balance"
      account.store_transactions
      expect(account.history.include?(header)).to be true
    end
  end

  describe '#print_statement' do
    it 'prints out header for statement' do
      header = "date || credit || debit || balance\n"
      account.store_transactions
      expect(account.print_statement).to eq header
    end
  end
end
