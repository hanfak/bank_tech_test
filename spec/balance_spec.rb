require 'balance'

describe Balance do
  subject(:balance) { described_class.new }

  it 'has 0 balance at start' do
    expect(balance.total).to eq 0
  end

  describe '#increase' do
    it 'add to balance total by amount' do
      balance.increase(10)
      expect(balance.total).to eq 10
    end

    it 'add to balance total several times with different amounts' do
      balance.increase(10)
      balance.increase(24)
      expect(balance.total).to eq 34
    end
  end

  describe '#reduce' do
    it 'subtract balance total by amount' do
      balance.reduce(10)
      expect(balance.total).to eq (-10)
    end

    it 'subtract balance total several times with different amounts' do
      balance.reduce(10)
      balance.reduce(24)
      expect(balance.total).to eq (-34)
    end
  end
end
