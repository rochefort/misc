class Money
  aattr_reader :amount, :currency

  def initialize(amount, currency = 'JPY')
    @amount = amount
    @currency = currency
  end

  def ==(other)
    amount == other.amount && currency == other.currency
  end

  def +(other)
    raise "Currency is differnt" unless currency == other.currency

    Money.new(amount + other.amount, currency)
  end

  def -(other)
    raise "Currency is differnt" unless currency == other.currency
    railse "Other money is bigger than self" if amount < other.amount

    Money.new(amount - other.amount, currency)
  end
end
