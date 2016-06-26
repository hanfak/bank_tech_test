class Balance
  attr_reader :total

  def initialize
    @total = 0
  end

  def increase(amount)
    @total += amount
  end

  def reduce(amount)
    @total -= amount
  end
end
