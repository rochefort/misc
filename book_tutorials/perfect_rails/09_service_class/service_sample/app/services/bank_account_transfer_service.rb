class BankAccountTransferService
  def initialize(from, to)
    @from = from
    @to = to
  end

  def transfer(money)
    BankAccount.transaction do
      @from.balance -= money
      @from.save!

      @to.balance += money
      @to.save!
    end
  end
end
