# == Schema Information
#
# Table name: bank_accounts
#
#  id         :integer          not null, primary key
#  amount     :integer
#  currency   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class BankAccount < ActiveRecord::Base
  composed_of :balance, class_name: 'Money', mapping: [%w(amount amount), %w(currency currency)]
end
