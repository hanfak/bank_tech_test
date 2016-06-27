require 'account'
require 'transaction'
describe Account do
  TODAY =Time.now.strftime("%m/%d/%y")

  subject(:account) { described_class.new }
  #create double transaction
  #return object with such and such
  let(:transaction1) {double :Transaction, date:'12/12/12', balance: 1000, credit: 1000, debit: nil}


# Remove when done
  describe '#initialize' do
    it 'balance of zero' do
      expect(account.balance.total).to eq 0
    end

    it 'empty history' do
      expect(account.account_history).to eq []
    end
  end

  describe '#credit' do

    # spy on balance.deposit
    # expect(oystercard.journey_log).to receive(:start_journey)
    it 'stores one' do
      account.credit(1000, '12/12/12')
      # p account.account_history
      # deposit_information = {date: '12/12/12',
      #                       credit: 1000,
      #                       debit: nil,
      #                       balance: 1000}
      p deposit_information = transaction1
      p account.account_history.last.date
      expect(account.account_history.last.balance).to equal deposit_information.balance
            expect(account.account_history.last).to be_a Transaction

    end

    xit 'stores multiple' do
      account.credit(2000, '12/12/12')
      account.credit(1000, '15/12/12')
      deposit_information = {date: '15/12/12',
                            credit: 1000,
                            debit: nil,
                            balance: 3000}
      expect(account.account_history.last).to eq deposit_information
    end

    xit 'with today\'s date' do
      account.credit(2000)
      deposit_information = {date: TODAY,
                            credit: 2000,
                            debit: nil,
                            balance: 2000}
      expect(account.account_history.last).to eq deposit_information
    end
  end

  describe '#debit' do

    # spy on balance.withdraw
    xit 'stores one' do
      account.debit(500, '14/12/12')
      deposit_information = {date: '14/12/12',
        credit: nil,
        debit: 500,
        balance: -500}
      expect(account.account_history.last).to eq deposit_information
    end

    xit 'stores multiple' do
      account.debit(500, '12/12/12')
      account.debit(1000, '15/12/12')
      deposit_information = {date: '15/12/12',
        credit: nil,
        debit: 1000,
        balance: -1500}
      expect(account.account_history.last).to eq deposit_information
    end

    xit 'with today\'s date' do
      account.debit(2000)
      deposit_information = {date: TODAY,
                            credit: nil,
                            debit: 2000,
                            balance: -2000}
      expect(account.account_history.last).to eq deposit_information
    end
  end

  describe '#print_statement' do
    it 'prints a statement of the account' do
      expected_statement = "date || credit || debit || balance\n14/01/12 ||  || 1500.00 || 2500.00\n13/01/12 || 2000.00 ||  || 4000.00\n10/01/12 || 2000.00 ||  || 2000.00"

      account.credit(2000, '10/01/12')
      account.credit(2000, '13/01/12')
      account.debit(1500, '14/01/12')
      # p account.account_history
      expect(account.print_statement).to eq expected_statement
    end
  end
end
