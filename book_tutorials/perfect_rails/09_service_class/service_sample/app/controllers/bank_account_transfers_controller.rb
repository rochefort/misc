class BankAccountTransfersController < ApplicationController
  def create
    from = BankAccount.find(params[:from_account_id])
    to   = BankAccount.find(params[:to_account_id])
    transferd_money = Money.new(params[:amount], params[:currency])

    bank_account_transfer_sersvice = BankAccountTransferService.new(from, to)
    bank_account_transfer_sersvice.transfer(transfered_money)
  end
end
