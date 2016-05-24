require 'account'

describe Account do
  subject(:account) {described_class.new}
  it {is_expected.to respond_to :print_statement}

  describe '#print_statement' do
    it 'initially shows the balance as 0.00' do
      expect(account.print_statement).to eq "date || credit || debit || balance\n14/01/2012 || || || 0.00"
    end
  end
end
