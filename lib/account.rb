require './lib/account_history.rb'

class Account
	attr_reader :balance

	def initialize(account_history = AccountHistory)
		@balance = 0
    @account_history = account_history.new
	end

  def process_transaction(transaction)
    @balance += transaction.amount
    @account_history.new_transaction(transaction)
  end

  
end
